# 4-bit Counter in Verilog

## Overview
This repository contains a basic 4-bit counter implemented in Verilog HDL. The counter is synchronous with the clock and features an active-high reset.

## Files
- `4-bit_counter.v` - Main Verilog source file containing:
  - `counter_4bit` module - The counter implementation
  - `counter_4bit_tb` module - Testbench for verification

## Counter Features
- 4-bit output (counts from 0 to 15)
- Synchronous operation with clock
- Active-high reset (resets to 0)
- Automatic rollover from 15 to 0

## Usage

### Simulation
To simulate the counter using a tool like ModelSim or Icarus Verilog:

```bash
# For Icarus Verilog
iverilog -o counter_sim 4-bit_counter.v
vvp counter_sim

# For ModelSim
vsim -do "do run.do"
```

### Synthesis
The counter can be synthesized for FPGAs using tools like Xilinx Vivado, Intel Quartus, or Lattice Diamond.

## Ports
- `clk` - Clock input
- `reset` - Active high reset signal
- `count[3:0]` - 4-bit output of the counter

## Example Waveform
When simulated, the counter will produce a pattern from 0000 to 1111, incrementing on each positive clock edge.

## Customization
To modify the counter width:
1. Change the output declaration: `output reg [N-1:0] count`
2. Adjust the reset value: `count <= N'b0`
3. Update the testbench accordingly

## License
This design is provided under the MIT License.