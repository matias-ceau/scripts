#!/usr/bin/python

import json
import os
import subprocess
import sys

import click
import matplotlib.pyplot as plt
import networkx as nx
from tqdm import tqdm


def get_search_path(path):
    """Returns the search path, ie the note folder"""
    if not path:
        search_path = "."
    else:
        try:
            search_path = os.path.expandvars(path)
            search_path = os.path.expanduser(search_path)
            assert os.path.isdir(search_path)
        except IndexError:
            search_path = os.path.abspath(".")
        except AssertionError:
            print("Not a valid path")
            exit(1)
    return os.path.abspath(search_path)


def list_all_notes(path: str) -> dict:
    note_list = subprocess.run(
        ["fd", r".md$", "-tf", path],
        capture_output=True,
        text=True,
    ).stdout.splitlines()
    return {f: i + 1 for i, f in enumerate(note_list)}


def get_references(path: str) -> list[dict]:
    p1 = subprocess.Popen(
        ["rg", r"\[\[[^\]|]+(?:\|[^\]]+)?\]\]", path, "--json"], stdout=subprocess.PIPE
    )
    p2 = subprocess.Popen(
        [
            "jq",
            "--compact-output",
            r'select(.type == "match") | {path: .data.path.text, submatches: [.data.submatches[].match.text]}',
        ],
        stdin=p1.stdout,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    # Close p1's stdout to allow p1 to receive a SIGPIPE if p2 exits
    p1.stdout.close()
    output, _ = p2.communicate()
    assert p2.returncode == 0
    output = "[" + output.decode().replace("}\n", "},\n")[:-2] + "]"
    return json.loads(output)


def get_hyperlink_id(link: str, all_files: dict) -> int:
    try:
        link = link.split("/")[-1]
        link = link.replace("[[", "").replace("]]", "")
        link = link.split("|")[0]
        link = link.split("#")[0]
        link = link if link.endswith(".md") else link + ".md"
        for l, id in all_files.items():
            if link == l.split("/")[-1]:
                return id
        else:
            return 0
    except Exception as e:
        print(f"{e} : there was a problem with {link}")
        return 0


def get_nodes_and_edges(data: list[dict], all_files: dict):
    nodes = list()
    edges = list()
    total = len(data)
    for item in tqdm(data, total=total, desc="Creating nodes and edges"):
        node_id = all_files.get(item["path"], 0)
        if node_id:
            nodes.append(node_id)
            for link in item["submatches"]:
                link_id = get_hyperlink_id(link, all_files)
                if link_id:
                    nodes.append(link_id)
                    edges.append((node_id, link_id))
    nodes = set(nodes)
    edges = set(edges)
    return list(nodes), list(edges)


def create_graph(nodes, edges):
    G = nx.DiGraph()
    G.add_nodes_from(nodes)
    G.add_edges_from(edges)
    return G


def draw_graph(graph):
    # Draw the graph
    pos = nx.spring_layout(graph)
    nx.draw(
        graph,
        pos,
        with_labels=False,
        node_color="lightblue",
        node_size=50,
        arrowsize=2,
    )

    # Show the graph
    plt.axis("off")
    # plt.tight_layout()
    plt.show()


@click.command()
@click.option("--path", default=".", help="Note path")
@click.option("--draw", is_flag=True, help="Draw the graph")
def main(path, draw):
    print("Searching files... 1/3")
    SEARCH_PATH: str = get_search_path(path)
    ALL_MD_FILES: dict = list_all_notes(SEARCH_PATH)
    print("Finding links in files... 2/3")
    DATA: list[dict] = get_references(SEARCH_PATH)
    print("Creating Graph... 3/3")
    NODES, EDGES = get_nodes_and_edges(DATA, ALL_MD_FILES)
    G = create_graph(NODES, EDGES)
    if draw:
        draw_graph(G)


if __name__ == "__main__":
    main()
