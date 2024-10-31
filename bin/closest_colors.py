#!/usr/bin/python

import sys


def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip("#")
    return tuple(int(hex_color[i : i + 2], 16) for i in (0, 2, 4))


def color_distance(c1, c2):
    return sum((a - b) ** 2 for a, b in zip(c1, c2)) ** 0.5


def find_closest_color(target_color, possible_colors):
    target_rgb = hex_to_rgb(target_color)
    closest_hex = min(
        possible_colors, key=lambda x: color_distance(target_rgb, hex_to_rgb(x))
    )
    closest_rgb = hex_to_rgb(closest_hex)
    return closest_hex, closest_rgb


def main(file1, file2=None):
    ansi8bit = """\
    color0\t#000000\ncolor1\t#800000\ncolor2\t#008000\ncolor3\t#808000\ncolor4\t#000080\ncolor5\t#800080\ncolor6\t#008080\ncolor7\t#c0c0c0\ncolor8\t#808080\ncolor9\t#ff0000\ncolor10\t#00ff00\ncolor11\t#ffff00\ncolor12\t#0000ff\ncolor13\t#ff00ff\ncolor14\t#00ffff\ncolor15\t#ffffff\ncolor16\t#000000\ncolor17\t#000033\ncolor18\t#000066\ncolor19\t#000099\ncolor20\t#0000cc\ncolor21\t#0000ff\ncolor22\t#003300\ncolor23\t#003333\ncolor24\t#003366\ncolor25\t#003399\ncolor26\t#0033cc\ncolor27\t#0033ff\ncolor28\t#006600\ncolor29\t#006633\ncolor30\t#006666\ncolor31\t#006699\ncolor32\t#0066cc\ncolor33\t#0066ff\ncolor34\t#009900\ncolor35\t#009933\ncolor36\t#009966\ncolor37\t#009999\ncolor38\t#0099cc\ncolor39\t#0099ff\ncolor40\t#00cc00\ncolor41\t#00cc33\ncolor42\t#00cc66\ncolor43\t#00cc99\ncolor44\t#00cccc\ncolor45\t#00ccff\ncolor46\t#00ff00\ncolor47\t#00ff33\ncolor48\t#00ff66\ncolor49\t#00ff99\ncolor50\t#00ffcc\ncolor51\t#00ffff\ncolor52\t#330000\ncolor53\t#330033\ncolor54\t#330066\ncolor55\t#330099\ncolor56\t#3300cc\ncolor57\t#3300ff\ncolor58\t#333300\ncolor59\t#333333\ncolor60\t#333366\ncolor61\t#333399\ncolor62\t#3333cc\ncolor63\t#3333ff\ncolor64\t#336600\ncolor65\t#336633\ncolor66\t#336666\ncolor67\t#336699\ncolor68\t#3366cc\ncolor69\t#3366ff\ncolor70\t#339900\ncolor71\t#339933\ncolor72\t#339966\ncolor73\t#339999\ncolor74\t#3399cc\ncolor75\t#3399ff\ncolor76\t#33cc00\ncolor77\t#33cc33\ncolor78\t#33cc66\ncolor79\t#33cc99\ncolor80\t#33cccc\ncolor81\t#33ccff\ncolor82\t#33ff00\ncolor83\t#33ff33\ncolor84\t#33ff66\ncolor85\t#33ff99\ncolor86\t#33ffcc\ncolor87\t#33ffff\ncolor88\t#660000\ncolor89\t#660033\ncolor90\t#660066\ncolor91\t#660099\ncolor92\t#6600cc\ncolor93\t#6600ff\ncolor94\t#663300\ncolor95\t#663333\ncolor96\t#663366\ncolor97\t#663399\ncolor98\t#6633cc\ncolor99\t#6633ff\ncolor100\t#666600\ncolor101\t#666633\ncolor102\t#666666\ncolor103\t#666699\ncolor104\t#6666cc\ncolor105\t#6666ff\ncolor106\t#669900\ncolor107\t#669933\ncolor108\t#669966\ncolor109\t#669999\ncolor110\t#6699cc\ncolor111\t#6699ff\ncolor112\t#66cc00\ncolor113\t#66cc33\ncolor114\t#66cc66\ncolor115\t#66cc99\ncolor116\t#66cccc\ncolor117\t#66ccff\ncolor118\t#66ff00\ncolor119\t#66ff33\ncolor120\t#66ff66\ncolor121\t#66ff99\ncolor122\t#66ffcc\ncolor123\t#66ffff\ncolor124\t#990000\ncolor125\t#990033\ncolor126\t#990066\ncolor127\t#990099\ncolor128\t#9900cc\ncolor129\t#9900ff\ncolor130\t#993300\ncolor131\t#993333\ncolor132\t#993366\ncolor133\t#993399\ncolor134\t#9933cc\ncolor135\t#9933ff\ncolor136\t#996600\ncolor137\t#996633\ncolor138\t#996666\ncolor139\t#996699\ncolor140\t#9966cc\ncolor141\t#9966ff\ncolor142\t#999900\ncolor143\t#999933\ncolor144\t#999966\ncolor145\t#999999\ncolor146\t#9999cc\ncolor147\t#9999ff\ncolor148\t#99cc00\ncolor149\t#99cc33\ncolor150\t#99cc66\ncolor151\t#99cc99\ncolor152\t#99cccc\ncolor153\t#99ccff\ncolor154\t#99ff00\ncolor155\t#99ff33\ncolor156\t#99ff66\ncolor157\t#99ff99\ncolor158\t#99ffcc\ncolor159\t#99ffff\ncolor160\t#cc0000\ncolor161\t#cc0033\ncolor162\t#cc0066\ncolor163\t#cc0099\ncolor164\t#cc00cc\ncolor165\t#cc00ff\ncolor166\t#cc3300\ncolor167\t#cc3333\ncolor168\t#cc3366\ncolor169\t#cc3399\ncolor170\t#cc33cc\ncolor171\t#cc33ff\ncolor172\t#cc6600\ncolor173\t#cc6633\ncolor174\t#cc6666\ncolor175\t#cc6699\ncolor176\t#cc66cc\ncolor177\t#cc66ff\ncolor178\t#cc9900\ncolor179\t#cc9933\ncolor180\t#cc9966\ncolor181\t#cc9999\ncolor182\t#cc99cc\ncolor183\t#cc99ff\ncolor184\t#cccc00\ncolor185\t#cccc33\ncolor186\t#cccc66\ncolor187\t#cccc99\ncolor188\t#cccccc\ncolor189\t#ccccff\ncolor190\t#ccff00\ncolor191\t#ccff33\ncolor192\t#ccff66\ncolor193\t#ccff99\ncolor194\t#ccffcc\ncolor195\t#ccffff\ncolor196\t#ff0000\ncolor197\t#ff0033\ncolor198\t#ff0066\ncolor199\t#ff0099\ncolor200\t#ff00cc\ncolor201\t#ff00ff\ncolor202\t#ff3300\ncolor203\t#ff3333\ncolor204\t#ff3366\ncolor205\t#ff3399\ncolor206\t#ff33cc\ncolor207\t#ff33ff\ncolor208\t#ff6600\ncolor209\t#ff6633\ncolor210\t#ff6666\ncolor211\t#ff6699\ncolor212\t#ff66cc\ncolor213\t#ff66ff\ncolor214\t#ff9900\ncolor215\t#ff9933\ncolor216\t#ff9966\ncolor217\t#ff9999\ncolor218\t#ff99cc\ncolor219\t#ff99ff\ncolor220\t#ffcc00\ncolor221\t#ffcc33\ncolor222\t#ffcc66\ncolor223\t#ffcc99\ncolor224\t#ffcccc\ncolor225\t#ffccff\ncolor226\t#ffff00\ncolor227\t#ffff33\ncolor228\t#ffff66\ncolor229\t#ffff99\ncolor230\t#ffffcc\ncolor231\t#ffffff\ncolor232\t#080808\ncolor233\t#121212\ncolor234\t#1c1c1c\ncolor235\t#262626\ncolor236\t#303030\ncolor237\t#3a3a3a\ncolor238\t#444444\ncolor239\t#4e4e4e\ncolor240\t#585858\ncolor241\t#626262\ncolor242\t#6c6c6c\ncolor243\t#767676\ncolor244\t#808080\ncolor245\t#8a8a8a\ncolor246\t#949494\ncolor247\t#9e9e9e\ncolor248\t#a8a8a8\ncolor249\t#b2b2b2\ncolor250\t#bcbcbc\ncolor251\t#c6c6c6\ncolor252\t#d0d0d0\ncolor253\t#dadada\ncolor254\t#e4e4e4\ncolor255\t#eeeeee\n"""
    if file2:
        with open(file2, "r") as i2:
            f2 = i2.readlines()
    else:
        f2 = ansi8bit.splitlines()
    with open(file1, "r") as i1:
        f1 = i1.readlines()
    desired_colors = [l.strip() for l in f1]
    possible_dict = dict([l.split()[::-1] for l in f2])
    possible_colors = list(possible_dict.keys())

    for color in desired_colors:
        closest, (r2, g2, b2) = find_closest_color(color, possible_colors)
        r1, g1, b1 = hex_to_rgb(color)
        origin_ansi = f"\033[38;2;{r1};{g1};{b1}m██████████\033[0m"
        closest_ansi = f"\033[38;2;{r2};{g2};{b2}m██████████\033[0m"
        print(
            f"{color:_<12}{origin_ansi}{closest_ansi}{closest:_>12}{possible_dict[closest]:>12}"
        )


if __name__ == "__main__":
    if len(sys.argv) == 3:
        file1 = sys.argv[1]
        file2 = sys.argv[2]
        main(file1, file2)
    elif len(sys.argv) == 2:
        file1 = sys.argv[1]
        main(file1)
    else:
        print("Usage: python script.py <file1> <file2>")
        sys.exit(1)
