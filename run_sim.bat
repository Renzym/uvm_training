@echo off
rem Setup Xilinx Vivado environment
call C:\Xilinx\Vivado\2021.2\settings64.bat

echo ====================================================
echo [STEP 1/3] Compiling design and testbench...
echo ====================================================
call xvlog -sv -L uvm my_pkg.svh uvm_hello_world.sv

if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed!
    exit /b %errorlevel%
)

echo ====================================================
echo [STEP 2/3] Elaborating the design...
echo ====================================================
call xelab -L uvm top -s top_sim -debug typical

if %errorlevel% neq 0 (
    echo [ERROR] Elaboration failed!
    exit /b %errorlevel%
)

echo ====================================================
echo [STEP 3/3] Running simulation...
echo ====================================================
call xsim top_sim -R

if %errorlevel% neq 0 (
    echo [ERROR] Simulation failed!
    exit /b %errorlevel%
)

echo ====================================================
echo Simulation completed successfully!
echo ====================================================
