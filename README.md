## Overview

This project focuses on the design and verification of the AMBA APB (Advanced Peripheral Bus) protocol, which is widely used for connecting low-bandwidth peripherals in SoC designs. The project includes:

RTL Design of APB Master and Slave modules

Functional Verification using SystemVerilog

Testbench Development with assertions, coverage, and sequences

## Features

Fully synthesizable APB Master and Slave modules

Implements APB read and write operations

Supports PREADY, PSLVERR, and PSEL signals

Parameterized design for easy adaptation to various bus widths

Comprehensive UVM/SystemVerilog verification environment

Assertion-based verification to ensure protocol compliance

Project Structure
APB-Design-Verification/
│
├── rtl/                # RTL source files
│   ├── apb_master.sv
│   ├── apb_slave.sv
│   └── apb_pkg.sv
│
├── tb/                 # Testbench files
│   ├── apb_env.sv
│   ├── apb_driver.sv
│   ├── apb_monitor.sv
│   ├── apb_scoreboard.sv
│   └── apb_test.sv
│
├── sim/                # Simulation scripts
│   └── run_simulation.sh
│
├── docs/               # Documentation
│   └── APB_Protocol_Design_Verification.pdf
│
└── README.md           # Project overview

## Tools and Technologies

Hardware Description Language: SystemVerilog

Verification Methodology: UVM (Universal Verification Methodology)

Simulation Tool: ModelSim/QuestaSim/Verilator (any standard simulator)

Coding Standards: RTL and testbench follow industry-standard coding practices


## Learning Outcomes

Understanding AMBA APB protocol timing and signal behavior

Designing RTL modules for bus communication

Developing verification environments with SystemVerilog/UVM

Writing test sequences and functional coverage

Debugging bus-level issues and verifying protocol compliance

## References

ARM AMBA Specification

UVM User Guide and SystemVerilog LRM



Hardware Description Language: SystemVerilog

Verification Methodology: UVM (Universal Verification Methodology)

Simulation Tools: ModelSim / QuestaSim / Verilator

Coding Standards: RTL and testbench follow industry-standard best practices
