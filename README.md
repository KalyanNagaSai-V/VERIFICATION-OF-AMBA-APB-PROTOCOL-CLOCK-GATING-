## Project Overview

This project presents the design and verification of the AMBA Advanced Peripheral Bus (APB) protocol using Verilog HDL.
The focus is on low-power implementation through multi-level clock gating, ensuring energy efficiency without sacrificing performance or reliability.

The APB protocol is part of the AMBA (Advanced Microcontroller Bus Architecture) and is widely used in System-on-Chip (SoC) designs for low-bandwidth peripheral communication.

## Key Features

Verilog HDL Implementation of APB protocol.

Clock Gating Integration for dynamic power reduction.

Master-Slave Communication model with read/write transactions.

Power Optimization (power reduced from 0.682 mW → 0.567 mW).

Testbench Architecture including driver, monitor, scoreboard, and reference model.

Simulation and Verification using EDA Playground and Xilinx Genus.

## Inputs and Outputs
Inputs (to DUT / Slave from Master / System Bus)

PCLK → Clock signal (synchronizes all transfers).

PRESETn → Active-low reset.

PADDR → Address bus (8/16/32-bit configurable).

PWRITE → Write control: 1 = Write, 0 = Read.

PWDATA → Data bus (for write operations).

PSEL → Peripheral Select (slave enable).

PENABLE → Enable signal (indicates ACCESS phase).

PSTRB (optional) → Byte lane selection for writes.

Outputs (from DUT / Slave to Master)

PRDATA → Read data bus.

PREADY → Ready signal: 1 = Slave ready, 0 = Wait state.

PSLVERR → Error indicator: 0 = No error, 1 = Transfer error.

## Block Diagram 

<img width="630" height="447" alt="image" src="https://github.com/user-attachments/assets/469faf5e-edee-4931-8c0c-3b7e39c86809" />



## APB Transfer Phases

IDLE State 💤

PSEL = 0, PENABLE = 0

No transaction, bus inactive.

SETUP State ⚙️

PSEL = 1, PENABLE = 0

Address (PADDR), control (PWRITE), and data (PWDATA if write) are driven.

ACCESS State 🚦

PSEL = 1, PENABLE = 1

Data transfer occurs:

Write → PWDATA sent to slave.

Read → PRDATA sent from slave.

PREADY = 1 → Transfer completes.

PREADY = 0 → Wait state until slave ready.

State Transition Flow:

<img width="383" height="324" alt="image" src="https://github.com/user-attachments/assets/2597139b-06a0-4cc5-abcb-e2b0879b9eb2" />


## Methodology

Design: APB protocol modeled in Verilog HDL with master-slave transactions.

Clock Gating: Idle modules gated to minimize toggling.

<img width="451" height="987" alt="image" src="https://github.com/user-attachments/assets/96466ace-1b8b-40a9-9f41-322f2426bb43" />


Verification: Structured testbench with driver, monitor, reference model, scoreboard.

Analysis: Power and area analysis via Cadence Genus.

## Testbench Architecture

Clock & Reset Generator

APB Master (Generator + Driver + Output Monitor)

<img width="970" height="511" alt="image" src="https://github.com/user-attachments/assets/2da7d964-6523-4b23-a1f5-504b778da1d6" />

Design Under Test (APB Slave)

Input Monitor

Reference Model

Scoreboard

## Results

Power Consumption: Reduced by ~28.9% with clock gating.

Area Overhead: ~9.3% due to clock gating.

Verification: Read/write transfers validated with/without wait states.

## Advantages

Low latency and simple implementation.

Easy integration into SoCs.

Power-efficient with clock gating.

Scalable for multiple peripherals.

## Limitations

Lower bandwidth than AXI/AHB.

Limited scalability for large systems.

No built-in error detection/recovery.

 ## Applications

Embedded systems (IoT, wearables, sensors).

SoC peripheral communication.

Low-power VLSI designs.

🔮 Future Scope

Hybrid integration with AXI/AHB.

Ultra-low-power APB for IoT/wearables.

Error detection (parity/CRC/ECC).

Security enhancements for IoT.

AI-driven adaptive optimization.

## Tools & Technologies

Languages: Verilog HDL

Simulation: EDA Playground

Synthesis & Analysis: Xilinx Genus, Cadence Genus

Verification: SystemVerilog testbench
