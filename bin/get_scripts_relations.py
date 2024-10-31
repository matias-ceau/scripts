#!/usr/bin/python

import os
import subprocess

import matplotlib.pyplot as plt
import networkx as nx


def run_command(command):
    process = subprocess.Popen(
        command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True
    )
    output, error = process.communicate()
    return output.decode("utf-8").strip()


dic = {}
scripts_dir = os.environ.get(
    "SCRIPTS", "."
)  # Use the SCRIPTS environment variable or current directory
scripts = run_command(f"fd . -t x {scripts_dir}").splitlines()

for k in scripts:
    query = os.path.basename(k)
    matches = run_command(f"rg --files-with-matches {query} {scripts_dir}").splitlines()
    dic[os.path.basename(k)] = [os.path.basename(m) for m in matches if m in scripts]

# Create a directed graph
G = nx.DiGraph()

# Add nodes and edges based on the data
for file, dependencies in dic.items():
    G.add_node(file)
    for dep in dependencies:
        G.add_edge(file, dep)


# Export to GraphGML for cytoscape
nx.write_gml(G, "/tmp/get_scripts_relations.gml")

# Draw the graph
pos = nx.spring_layout(G)
nx.draw(
    G,
    pos,
    with_labels=True,
    node_color="lightblue",
    node_size=500,
    font_size=8,
    arrows=True,
)

# Add edge labels
edge_labels = {(u, v): "" for (u, v) in G.edges()}
nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels)

# Show the plot
plt.axis("off")
plt.show()
