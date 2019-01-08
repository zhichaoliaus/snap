
set TopModule "hls_action"
set ClockPeriod "4.000000"
set ClockList {ap_clk}
set multiClockList {}
set PortClockMap {}
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag  1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 0
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 0
set ResetStyle "control"
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set fsmEncStyle "onehot"
set maxFanout "0"
set RtlPrefix ""
set ExtraCCFlags ""
set ExtraCLdFlags ""
set SynCheckOptions ""
set PresynOptions ""
set PreprocOptions ""
set SchedOptions ""
set BindOptions ""
set RtlGenOptions ""
set RtlWriterOptions ""
set CbcGenFlag ""
set CasGenFlag ""
set CasMonitorFlag ""
set AutoSimOptions {}
set ExportMCPathFlag "0"
set SCTraceFileName "mytrace"
set SCTraceFileFormat "vcd"
set SCTraceOption "all"
set TargetInfo "xcvu9p:-flgb2104:-2l-e"
set SourceFiles {sc {} c ../../action_uppercase.cpp}
set SourceFlags {sc {} c {{-I/afs/apd.pok.ibm.com/func/vlsi/eclipz/c14/usr/zhichao/p9nd2/SNAP/snap/actions/include -I/afs/apd.pok.ibm.com/func/vlsi/eclipz/c14/usr/zhichao/p9nd2/SNAP/snap/software/include -I../../../software/examples -I../include}}}
set DirectiveFile {/afs/apd.pok.ibm.com/func/vlsi/eclipz/c14/usr/zhichao/p9nd2/SNAP/snap/actions/hls_helloworld/hw/hlsUpperCase_xcvu9p-flgb2104-2l-e/helloworld/helloworld.directive}
set TBFiles {verilog ../../action_uppercase.cpp bc ../../action_uppercase.cpp vhdl ../../action_uppercase.cpp sc ../../action_uppercase.cpp cas ../../action_uppercase.cpp c {}}
set SpecLanguage "C"
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set TBInstNames {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set PlatformFiles {{DefaultPlatform {xilinx/virtexuplus/virtexuplus xilinx/virtexuplus/virtexuplus_fpv7}}}
set DefaultPlatform "DefaultPlatform"
set TBTVFileNotFound ""
set AppFile "../vivado_hls.app"
set ApsFile "helloworld.aps"
set AvePath "../.."
set HPFPO "0"
