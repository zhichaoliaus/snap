open_project "hlsUpperCase_xcvu9p-flgb2104-2l-e"

set_top hls_action

# Can that be a list?
foreach file [ list action_uppercase.cpp  ] {
  add_files ${file} -cflags " -I/afs/apd.pok.ibm.com/func/vlsi/eclipz/c14/usr/zhichao/p9nd2/SNAP/snap/actions/include -I/afs/apd.pok.ibm.com/func/vlsi/eclipz/c14/usr/zhichao/p9nd2/SNAP/snap/software/include -I../../../software/examples -I../include"
  add_files -tb ${file} -cflags " -DNO_SYNTH -I/afs/apd.pok.ibm.com/func/vlsi/eclipz/c14/usr/zhichao/p9nd2/SNAP/snap/actions/include -I/afs/apd.pok.ibm.com/func/vlsi/eclipz/c14/usr/zhichao/p9nd2/SNAP/snap/software/include -I../../../software/examples -I../include"
}

open_solution "helloworld"
set_part xcvu9p-flgb2104-2l-e

create_clock -period 4 -name default
config_interface -m_axi_addr64=true
#config_rtl -reset all -reset_level low

csynth_design
#export_design -format ip_catalog -rtl vhdl
exit
