# 3-Stage-PMOS-Operational-Amplifier-Initial-Planner

MATLAB script for the initial transistor width calculation of a 3-Stage PMOS Operational Amplifier based on the given specifications. This was part of the operational amplifier design project for my Electronics 3 course. 

## Use
The algorithm requires following inputs:

- $C_L$: Load capacitance
- $GB$: Gain-bandwidth product
- $SR$: Slew rate
- $V_{dd}$: Positive supply voltage
- $V_{ss}$: Negative supply voltage
- $k_n$: n-transistor process parameter
- $k_p$: p-transistor process parameter
- $V_{in\_min}$: Minimum allowable input voltage
- $V_{in\_max}$: Maximum allowable input voltage
- $V_{T1\_min}$: Minimum threshold voltage of transistor M1
- $V_{T1\_max}$: Maximum threshold voltage of transistor M1
- $V_{T3\_max}$: Maximum threshold voltage of transistor M3

Based on these specifications and the circuit characteristics, the algorithm outputs an initial calculation of $C_c$ (Miller capacitance), $I_8$ (bias current) and the width of each transistor. After that, further fine-tuning via Cadence SPICE is typically needed so that the amplifier meets the final specifications.

## Documentation
You can find the documentation (report) for this project [here](docs.md). Although the documentation is in Greek, it includes a handful of calculations and images, so non-Greek-speaking readers can still get a sense of the project.
