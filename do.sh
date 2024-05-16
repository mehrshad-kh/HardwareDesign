#!/bin/zsh

# Be careful with these options.
set -euo pipefail

# usage: cp_to_dir [file...] directory
# Copies files to the directory if they have been changed.
# Creates the directory if it does not exist.
function cp_to_dir()
{
    # Capture arguments 1 to one-to-last.
    srcs=("${@: 1: $# - 1}")
    # Capture the last argument.
    dir=${@: -1}

    # If $dir does not exist, create it.
    [[ -d $dir ]] || mkdir -p $dir

    for src in $srcs; do
        diff $src $dir/$(basename $src) >/dev/null

        [[ $? -ne 0 ]] && cp $src $dir
    done

    cp $srcs $dir
}

cd vhdl
cp_to_dir $projects/uni/04/labs/arch/02/Comparator* comparator
cp_to_dir $projects/uni/04/labs/arch/02/Decoder* decoder
cp_to_dir $projects/uni/04/labs/arch/02/Multiplexer* multiplexer

cp_to_dir $projects/uni/04/labs/arch/03/DFF* flip_flop/d

cp_to_dir $projects/uni/04/labs/arch/04/FourBitRippleCarryAdder* adder/four_bit_ripple_carry_adder
cp_to_dir $projects/uni/04/labs/arch/04/FullAdder* adder/full_adder

cp_to_dir $projects/uni/04/labs/arch/07/Ram* memory/ram

cp_to_dir $projects/uni/04/labs/arch/hw/AsyncJKFF* flip_flop/jk/async
cp_to_dir $projects/uni/04/labs/arch/hw/SyncJKFF* flip_flop/jk/sync
cp_to_dir $projects/uni/04/labs/arch/hw/TFF* flip_flop/t
cp_to_dir $projects/uni/04/labs/arch/hw/ThreeBit* counter/bidi/3-bit
cp_to_dir $projects/uni/04/labs/arch/hw/EightBit* counter/bidi/8-bit

cp_to_dir $projects/uni/04/labs/arch/05/HalfAdder* adder/half_adder
cp_to_dir $projects/uni/04/labs/arch/05/*ArrayMultiplier* multiplier/array

cp_to_dir $projects/uni/04/labs/arch/06/ShiftRegister* shift_register

cd ..
cd verilog
cp_to_dir $projects/uni/03/labs/logic/05/*multiplexer* multiplexer
cp_to_dir $projects/uni/03/labs/logic/05/*priority_encoder* priority_encoder
cp_to_dir $projects/uni/03/labs/logic/05/*decoder* decoder

cp_to_dir $projects/uni/03/labs/logic/06/*comparator* comparator

cp_to_dir $projects/uni/03/labs/logic/07/*full_adder* adder/full_adder
cp_to_dir $projects/uni/03/labs/logic/07/*ripple_carry_adder* adder/ripple_carry_adder

cp_to_dir $projects/uni/03/labs/logic/08/* alu

cp_to_dir $projects/uni/03/labs/logic/09/*flip_flop* flip_flop/jk

cp_to_dir $projects/uni/03/labs/logic/09/bcd_to_seven_seg.v sequential_circuit
cp_to_dir $projects/uni/03/labs/logic/09/freq_divider.v sequential_circuit
cp_to_dir $projects/uni/03/labs/logic/09/seq_circuit.v sequential_circuit

cp_to_dir $projects/uni/03/labs/logic/10/* fsm

exit 0

