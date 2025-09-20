#!/bin/sh

set -u

. /root/venv/bin/activate

libpath=$(python3 -c 'import libarchive; print(libarchive.__path__[0])')
libarchive=$(python3 -c 'import ctypes.util; print(ctypes.util.find_library("archive"))')
cp -v /lib64/$libarchive $libpath/
ldd $libpath/$libarchive | grep -o '=> [^ ]\+' | sed 's/^=> //' | xargs cp -vt $libpath/
nuitka --onefile xva_bridge.py --user-package-configuration-file=my.nuitka-package.config.yml
