transcript on
if ![file isdirectory vhdl_libs] {
	file mkdir vhdl_libs
}

vlib vhdl_libs/altera
vmap altera ./vhdl_libs/altera
vcom -93 -work altera {e:/altera/quartus/eda/sim_lib/altera_syn_attributes.vhd}
vcom -93 -work altera {e:/altera/quartus/eda/sim_lib/altera_standard_functions.vhd}
vcom -93 -work altera {e:/altera/quartus/eda/sim_lib/alt_dspbuilder_package.vhd}
vcom -93 -work altera {e:/altera/quartus/eda/sim_lib/altera_europa_support_lib.vhd}
vcom -93 -work altera {e:/altera/quartus/eda/sim_lib/altera_primitives_components.vhd}
vcom -93 -work altera {e:/altera/quartus/eda/sim_lib/altera_primitives.vhd}

vlib vhdl_libs/lpm
vmap lpm ./vhdl_libs/lpm
vcom -93 -work lpm {e:/altera/quartus/eda/sim_lib/220pack.vhd}
vcom -93 -work lpm {e:/altera/quartus/eda/sim_lib/220model.vhd}

vlib vhdl_libs/sgate
vmap sgate ./vhdl_libs/sgate
vcom -93 -work sgate {e:/altera/quartus/eda/sim_lib/sgate_pack.vhd}
vcom -93 -work sgate {e:/altera/quartus/eda/sim_lib/sgate.vhd}

vlib vhdl_libs/altera_mf
vmap altera_mf ./vhdl_libs/altera_mf
vcom -93 -work altera_mf {e:/altera/quartus/eda/sim_lib/altera_mf_components.vhd}
vcom -93 -work altera_mf {e:/altera/quartus/eda/sim_lib/altera_mf.vhd}

vlib vhdl_libs/altera_lnsim
vmap altera_lnsim ./vhdl_libs/altera_lnsim
vlog -sv -work altera_lnsim {e:/altera/quartus/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv}
vcom -93 -work altera_lnsim {e:/altera/quartus/eda/sim_lib/altera_lnsim_components.vhd}

vlib vhdl_libs/cycloneiv_hssi
vmap cycloneiv_hssi ./vhdl_libs/cycloneiv_hssi
vcom -93 -work cycloneiv_hssi {e:/altera/quartus/eda/sim_lib/cycloneiv_hssi_components.vhd}
vcom -93 -work cycloneiv_hssi {e:/altera/quartus/eda/sim_lib/cycloneiv_hssi_atoms.vhd}

vlib vhdl_libs/cycloneiv_pcie_hip
vmap cycloneiv_pcie_hip ./vhdl_libs/cycloneiv_pcie_hip
vcom -93 -work cycloneiv_pcie_hip {e:/altera/quartus/eda/sim_lib/cycloneiv_pcie_hip_components.vhd}
vcom -93 -work cycloneiv_pcie_hip {e:/altera/quartus/eda/sim_lib/cycloneiv_pcie_hip_atoms.vhd}

vlib vhdl_libs/cycloneiv
vmap cycloneiv ./vhdl_libs/cycloneiv
vcom -93 -work cycloneiv {e:/altera/quartus/eda/sim_lib/cycloneiv_atoms.vhd}
vcom -93 -work cycloneiv {e:/altera/quartus/eda/sim_lib/cycloneiv_components.vhd}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/split.vhd}
vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/InitialPermutation.vhd}
vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/FinalPermutation.vhd}
vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/splitKey.vhd}
vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/BinaryRotation.vhd}
vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/KeyPermutation.vhd}
vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/permutation.vhd}
vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/KeyGenerator.vhd}
vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/Box.vhd}
vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/Crypto.vhd}
vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/BinaryRotation2.vhd}
vcom -93 -work work {C:/Users/chris/Desktop/SDA/3DES/KeyGenerator2.vhd}

