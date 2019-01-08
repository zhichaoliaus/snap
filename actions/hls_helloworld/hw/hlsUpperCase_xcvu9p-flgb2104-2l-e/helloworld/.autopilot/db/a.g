#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /afs/apd.pok.ibm.com/func/vlsi/eclipz/c14/usr/zhichao/p9nd2/SNAP/snap/actions/hls_helloworld/hw/hlsUpperCase_xcvu9p-flgb2104-2l-e/helloworld/.autopilot/db/a.g.bc ${1+"$@"}
