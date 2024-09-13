# printformat="\
# %a for arch, \n\
# %b for builddate,\n\
# %d for description,\n\
# %e for pkgbase,\n\
# %f for filename,\n\
# %g for base64 encoded PGP signature,\n\
# %h for sha256sum,\n\
# %m for md5sum,\n\
# %n for pkgname,\n\
# %p for packager,\n\
# %v for pkgver,\n\
# %l for location,\n\
# %r for repository,\n\
# %s for size,\n\
# %C for checkdepends,\n\
# %D for depends,\n\
# %G for groups,\n\
# %H for conflicts,\n\
# %L for licenses,\n\
# %M for makedepends,\n\
# %O for optional depends,\n\
# %P for provides\n\
# %R for replaces.\n"

printformat="\
+ repository: %r\n\
+ pkgname: %n\n\
+ builddate: %b\n\
+ description: %d\n\
+ pkgbase: %e\n\
+ filename: %f\n\
+ packager: %p\n\
+ pkgver: %v\n\
+ size: %s\n\
+ location: %l\n\
+ arch: %a\n\
+ checkdepends: %C\n\
+ depends: %D\n\
+ groups: %G\n\
+ conflicts: %H\n\
+ licenses: %L\n\
+ makedepends: %M\n\
+ optional depends: %O\n\
+ provides: %P \n\
+ replaces: %R \n"
pacman -Sp --print-format="$(echo -e "$printformat")" autoconf
exit
pacman -Sl --color=always |
        fzf \
                -q "$1" \
                -m \
                --ansi \
                --preview 'pacman -Sp --print-format="$printformat" --color=always {2}' \
                --preview-window '60%'
