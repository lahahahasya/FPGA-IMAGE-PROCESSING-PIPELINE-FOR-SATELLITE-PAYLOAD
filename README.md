# Image Processing Pipeline for Satellite Payload

## Overview
This project implements a real-time FPGA-based image processing pipeline designed for satellite payload applications. The architecture follows a fully streaming design capable of processing one pixel per clock cycle with deterministic latency and low power consumption.

The pipeline performs:
- Background subtraction
- Gaussian noise reduction (5x5)
- Sobel edge detection (3x3)

The design is optimized for hardware efficiency and real-time operation on Xilinx Artix-7 FPGA.

## Key Features
- Fully streaming architecture (no full-frame buffering)
- Processes **1 pixel per clock cycle**
- Low-latency, deterministic hardware pipeline
- Hardware-friendly gradient magnitude (no square root)
- Designed for radiation-resilient space applications
- Verified using Vivado behavioral simulation

## Architecture

Processing chain:

Input Pixel Stream → Background Subtraction → 5x5 Gaussian Filter → Sobel Edge Detector → Edge Output


### Hardware Design Techniques
- Line buffers for sliding window generation
- Shift-register based windowing
- Fully pipelined streaming architecture
- Fixed-point arithmetic
- No frame memory required


## FPGA Target
- Device: **AMD Xilinx Artix-7 XC7A200T**
- Target Frequency: **100 MHz**
- Max Achieved Frequency: **~140 MHz**


## Resource Utilization (Estimated)

| Resource | Utilization |
|----------|-------------|
| LUT      | 35–45%      |
| Registers| 30–40%      |
| BRAM     | 40–50%      |
| DSP      | 20–25%      |



## Modules

| Module | Function |
|--------|----------|
| `bg_subtract.v` | Background subtraction |
| `line_buffer.v` | Pixel delay buffer |
| `window3x3.v` | Sliding 3×3 window generator |
| `window5x5.v` | Sliding 5×5 window generator |
| `gaussian5x5.v` | Gaussian noise filter |
| `sobel3x3.v` | Edge detection |
| `full_pipeline_top.v` | Complete pipeline |
| `tb.v` | Testbench |


## Simulation
- Input image streamed from memory file
- Verified in Vivado behavioral simulation
- Correct pipeline fill latency observed


## Applications
- Satellite payload onboard image processing
- Real-time edge detection
- Low-power embedded vision systems
- Space-grade streaming FPGA pipelines


 
