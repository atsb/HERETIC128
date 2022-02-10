@echo off
cls
type BATCHLST.TXT
choice /C:123450 /N Please select what to clean:
echo.
if ERRORLEVEL 6 goto end
if ERRORLEVEL 1 set DIR=TICSBETA
if ERRORLEVEL 2 set DIR=TIC10S
if ERRORLEVEL 3 set DIR=TIC10R
if ERRORLEVEL 4 set DIR=TIC12
if ERRORLEVEL 5 set DIR=TIC13

del %DIR%\*.*
set DIR=
:end
