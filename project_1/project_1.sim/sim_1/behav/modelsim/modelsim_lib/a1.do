# //  ModelSim SE-64 10.6e Jun 23 2018
# //
# //  Copyright 1991-2018 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  ModelSim SE-64 and its associated documentation contain trade
# //  secrets and commercial or financial information that are the property of
# //  Mentor Graphics Corporation and are privileged, confidential,
# //  and exempt from disclosure under the Freedom of Information Act,
# //  5 U.S.C. Section 552. Furthermore, this information
# //  is prohibited from disclosure under the Trade Secrets Act,
# //  18 U.S.C. Section 1905.
# //
# do {a1_simulate.do}
# vsim -voptargs=""+acc"" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.a1 xil_defaultlib.glbl 
# Start time: 19:42:07 on Oct 08,2019
# ** Warning: (vsim-8891) All optimizations are turned off because the -novopt switch is in effect. This will cause your simulation to run very slowly. If you are using this switch to preserve visibility for Debug or PLI features please see the User's Manual section on Preserving Object Visibility with vopt.
# Loading xil_defaultlib.a1
# Loading xil_defaultlib.glbl
# 1
# 1
# .main_pane.wave.interior.cs.body.pw.wf
# .main_pane.structure.interior.cs.body.struct
# .main_pane.objects.interior.cs.body.tree
force -freeze sim:/a1/a 0 0
run 1us
force -freeze sim:/a1/a 1 0
run 1us
run
run -continue
run
run
run
run
run
run
run
run
run
