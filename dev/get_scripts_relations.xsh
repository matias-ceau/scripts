#!/usr/bin/env xonsh

import json
import networkx as nx
import matplotlib.pyplot as plt

dic=dict()
scripts = $(fd . -tx $SCRIPTS).splitlines()

for k in scripts:
    query = $(basename @(k))
    matches = $(rg --files-with-matches @(query) $SCRIPTS).splitlines()
    dic[$(basename @(k))] = [$(basename @(m)) for m in matches if m in scripts]

# json_output = json.dumps(dic)
data = dic

# Create a directed graph
G = nx.DiGraph()

# Add nodes and edges based on the JSON data
for file, dependencies in data.items():
    G.add_node(file)
    for dep in dependencies:
        G.add_edge(file, dep)

# Draw the graph
pos = nx.spring_layout(G)
nx.draw(G, pos, with_labels=True, node_color='lightblue',
        node_size=500, font_size=8, arrows=True)

# Add edge labels
edge_labels = {(u, v): '' for (u, v) in G.edges()}
nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels)

# Show the plot
plt.axis('off')
# plt.tight_layout()
plt.show()
