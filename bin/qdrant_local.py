#!/usr/bin/env python3
import argparse
import os
import shlex
import subprocess
import sys
from pathlib import Path


def run(cmd: list[str]) -> int:
    return subprocess.call(cmd)


def check_docker(docker_bin: str) -> None:
    try:
        subprocess.run(
            [docker_bin, "version"],
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    except Exception as e:
        print("Error: Docker is required to run Qdrant server.")
        print("- Install Docker: https://docs.docker.com/get-docker/")
        print(f"- Details: {e}")
        sys.exit(1)


def sanitize_container_name(name: str) -> str:
    # Docker allows [a-zA-Z0-9][a-zA-Z0-9_.-]
    # We will keep it simple: lower, replace spaces and slashes
    safe = name.strip().lower().replace("/", "-").replace(" ", "-")
    return safe


def main():
    parser = argparse.ArgumentParser(
        description="Launch a local Qdrant server (Docker) with persistent storage."
    )

    parser.add_argument(
        "--base-dir",
        default="~/.local/db/qdrant",
        help="Base directory for Qdrant data (default: ~/.local/db/qdrant)",
    )
    parser.add_argument(
        "--name",
        default="default",
        help='Database directory name (default: "default")',
    )

    parser.add_argument(
        "--host",
        default="127.0.0.1",
        help="Host/IP to bind to (default: 127.0.0.1). Use 0.0.0.0 to expose on all interfaces.",
    )
    parser.add_argument(
        "--port", type=int, default=6333, help="REST port to expose (default: 6333)"
    )
    parser.add_argument(
        "--grpc-port",
        type=int,
        default=6334,
        help="gRPC port to expose (default: 6334)",
    )

    parser.add_argument(
        "--api-key",
        default="",
        help="Optional API key to require for all requests (sets QDRANT__SERVICE__API_KEY).",
    )
    parser.add_argument(
        "--image",
        default="qdrant/qdrant:latest",
        help="Docker image to use (default: qdrant/qdrant:latest)",
    )
    parser.add_argument(
        "--container-name",
        default="",
        help="Optional Docker container name. Defaults to qdrant-<name> (dots replaced with dashes).",
    )
    parser.add_argument(
        "--detach",
        action="store_true",
        help="Run container in background (detached).",
    )
    parser.add_argument(
        "--replace",
        action="store_true",
        help="If a container with the same name exists, stop and remove it before starting.",
    )

    args = parser.parse_args()

    # Resolve storage directory
    base_dir = Path(args.base_dir).expanduser()
    base_dir.mkdir(parents=True, exist_ok=True)

    db_dir = base_dir / f"{args.name}"
    db_dir.mkdir(parents=True, exist_ok=True)

    # Check docker
    docker_bin = os.environ.get("DOCKER_BIN", "docker")
    check_docker(docker_bin)

    # Container name
    default_cname = f"qdrant-{args.name}"
    container_name = sanitize_container_name(args.container_name or default_cname)

    # Replace existing container if requested
    if args.replace:
        subprocess.run(
            [docker_bin, "rm", "-f", container_name],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )

    # Build docker run command
    cmd = [
        docker_bin,
        "run",
        "--name",
        container_name,
        "-p",
        f"{args.host}:{args.port}:6333",
        "-p",
        f"{args.host}:{args.grpc_port}:6334",
        "-v",
        f"{str(db_dir)}:/qdrant/storage",
    ]

    if args.detach:
        cmd.append("-d")

    # Security: only set API key if provided
    if args.api_key:
        cmd += ["-e", f"QDRANT__SERVICE__API_KEY={args.api_key}"]

    # Use the selected image
    cmd.append(args.image)

    # Run
    print("Launching Qdrant server with:")
    print(" ", " ".join(shlex.quote(p) for p in cmd))

    rc = run(cmd)
    if rc != 0:
        print("Failed to start Qdrant container.")
        sys.exit(rc)

    print()
    print("Qdrant server is starting.")
    print(f"Container: {container_name}")
    print(f"Storage:   {db_dir}")
    print(f"REST URL:  http://{args.host}:{args.port}")
    print(f"Dashboard: http://{args.host}:{args.port}/dashboard")
    print(f"gRPC:      {args.host}:{args.grpc_port}")

    if args.api_key:
        print("Auth:      enabled (use header: api-key: <your key>)")
    else:
        print("Auth:      disabled (no API key required)")

    print()
    print("Useful commands:")
    print(f"- View logs:   {docker_bin} logs -f {container_name}")
    print(f"- Stop:        {docker_bin} stop {container_name}")
    print(f"- Remove:      {docker_bin} rm -f {container_name}")
    print(
        f"- Test:        curl {'-H "api-key: ' + args.api_key + '" ' if args.api_key else ''}http://{args.host}:{args.port}/collections"
    )

    print()
    print(
        "Note: Do not access the same storage directory concurrently with an embedded Qdrant client."
    )


if __name__ == "__main__":
    main()
