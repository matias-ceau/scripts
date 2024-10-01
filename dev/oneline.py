import sys

from libqtile.command.client import InteractiveCommandClient


def main():
    c = InteractiveCommandClient()


#     std_dic_list = eval(sys.stdin.read())
#     fields = "id group floating wm_class name".split()
#     return [
#         print(f"{a}{b}{c}{d}{e}")
#         for a, b, c, d, e in
#         [
#             [d.get(v) for v in fields]
#             for d in std_dic_list
#         ]
#     ]
#

# :<{str(max([len(str(dic[k])) for dic in std_dic_list]))}
# TODO: STEPS
# - get full list c.windows()
# - identify current (based on name ?)
# - check if hidden/floating/movable c.w.is_visible .toggle + bring_to_front depending on layout but put back after
# - change group if needed c.group['str'].toscreen() + move the viewer window
# - quickly focus and unfocus to highlight and maybe change opacity
# -

# In [71]: def movemovemove():
#     ...:     c.group['4'].toscreen()
#     ...:     time.sleep(3)
#     ...:     c.window[16777288].focus()
#     ...:     time.sleep(3)
#     ...:     c.group['6'].toscreen()
#     ...:     time.sleep(3)
#     ...:     c.window[16777400].focus()
# main()
