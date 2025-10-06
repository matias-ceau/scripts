#!/bin/bash
# ===== Reset =====
sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing

# ===== Remote Access =====
sudo ufw allow 22/tcp        # SSH
sudo ufw allow 5900/tcp      # VNC
sudo ufw allow 3389/tcp      # RDP

# ===== File Sync / Media =====
sudo ufw allow 22000/tcp     # Syncthing
sudo ufw allow 21027/udp
sudo ufw allow 8384/tcp      # Syncthing web console
sudo ufw allow 6680/tcp      # Mopidy
sudo ufw allow 6600/tcp      # MPD

# ===== File / Print Sharing =====
sudo ufw allow 137/udp
sudo ufw allow 138/udp
sudo ufw allow 139/tcp
sudo ufw allow 445/tcp       # Samba
sudo ufw allow 2049/tcp
sudo ufw allow 2049/udp      # NFS
sudo ufw allow 631/tcp       # CUPS

# ===== Databases / Dev =====
sudo ufw allow 5432/tcp      # PostgreSQL
sudo ufw allow 3306/tcp      # MariaDB/MySQL
sudo ufw allow 8888/tcp      # Jupyter
sudo ufw allow 8000/tcp      # Django/Flask dev
sudo ufw allow 8080/tcp      # generic http/dev, IPFS gateway
sudo ufw allow 5000/tcp      # Python dev servers

# ===== Monitoring =====
sudo ufw allow 3000/tcp      # Grafana
sudo ufw allow 19999/tcp     # Netdata

# ===== P2P & Crypto =====
sudo ufw allow 6881/tcp
sudo ufw allow 6881/udp      # qBittorrent
sudo ufw allow 18080/tcp     # Monero node
sudo ufw allow 4001/tcp      # IPFS swarm
sudo ufw allow 5001/tcp      # IPFS API
# 8080 already allowed (IPFS gateway)

# ===== SIP / VoIP =====
sudo ufw allow 5060/udp      # SIP signaling

# ===== Enable =====
sudo ufw --force enable
sudo ufw status verbose
