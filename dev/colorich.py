from rich.console import Console
from rich.table import Table
from rich.color import Color

console = Console()

# Define your color palette
colors = [
    "#011627", "#FF0022", "#A2D729", "#FDFFFC", 
    "#B91372", "#FFD700", "#1E90FF", "#00CED1", 
    "#555555", "#FF4500", "#ADFF2F", "#FFFF55", 
    "#4682B4", "#FF69B4", "#40E0D0", "#FFFFFF"
]

# Create a table to display the colors
table = Table(title="Color Palette")

table.add_column("Color Name", justify="center")
table.add_column("Hex Value", justify="center")
table.add_column("Sample", justify="center")

for i, color in enumerate(colors):
    table.add_row(f"Color {i}", color, f"[{color}]██████[/]")

console.print(table)

