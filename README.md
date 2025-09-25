# Memory-Project-Pre

A SystemVerilog-based verification environment for a memory (RAM) design.

## Overview

This repository contains a UVM-style testbench and related components for verifying a memory (RAM) module in SystemVerilog. The project provides reusable verification infrastructure, including environment, agent, driver, monitor, scoreboard, sequences, coverage, and a memory DUT.

## Repository Structure

- `memory.v` - The memory (RAM) RTL design under test (DUT).
- `mem_env.sv` - UVM environment encapsulating all components.
- `mem_agent.sv` - UVM agent containing driver, sequencer, and monitor.
- `mem_driver.sv` - UVM driver for driving transactions to the DUT.
- `mem_monitor.sv` - UVM monitor for observing DUT signals.
- `mem_scoreboard.sv` - UVM scoreboard for checking correctness.
- `mem_coverage.sv` - Coverage collection for the verification environment.
- `mem_seq_lib.sv` - Sequence library to generate test stimulus.
- `mem_sequencer.sv` - UVM sequencer for sequencing transactions.
- `mem_tx.sv` - Transaction class (sequence item) definition.
- `mem_test.sv` - Top-level test class for executing test scenarios.
- `mem_common.sv` - Shared definitions and utilities.
- `mem_intrf.sv` - Memory interface definition.
- `top.sv` - Top-level testbench module tying everything together.
- `.gitattributes` - Git attributes configuration.

## Getting Started

1. **Prerequisites**
   - SystemVerilog simulator (e.g., ModelSim, VCS, Questa)
   - UVM library (Universal Verification Methodology)

2. **How to Run**
   - Clone this repository:
     ```
     git clone https://github.com/Aditya-kori/Memory-Project-Pre.git
     cd Memory-Project-Pre
     ```
   - Compile all `.sv` and `.v` files with your simulator, making sure to include the UVM library.
   - Run the `top.sv` testbench.

3. **Customization**
   - Add or modify sequences in `mem_seq_lib.sv` to expand stimulus.
   - Update `mem_coverage.sv` to track additional coverage metrics.
   - Extend `mem_test.sv` for more complex test scenarios.

## License

This project is distributed without a license file. If you intend to use or modify this work, please contact the repository owner.

## Author

- [Aditya-kori](https://github.com/Aditya-kori)

---

Feel free to open issues or contribute to this repository!
