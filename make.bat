@echo off
where nmake
if ERRORLEVEL 1 (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\vc\Auxiliary\Build\vcvars64.bat"
)
nmake /f win.mak %1
