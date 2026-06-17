@echo off
echo Cleaning simulation output files...

if exist xsim.dir (
    echo Removing xsim.dir directory...
    rmdir /s /q xsim.dir
)

echo Removing log, journal, and wave database files...
del /q /f *.log *.pb *.jou *.wdb 2>nul

echo Clean complete!
