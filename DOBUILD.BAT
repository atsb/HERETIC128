@echo off
cls
type BATCHLST.TXT
choice /C:123450 /N Please select what to build:
echo.
if ERRORLEVEL 6 goto end
if ERRORLEVEL 1 set TARGET=TICSBETA
if ERRORLEVEL 2 set TARGET=TIC10S
if ERRORLEVEL 3 set TARGET=TIC10R
if ERRORLEVEL 4 set TARGET=TIC12
if ERRORLEVEL 5 set TARGET=TIC13

if "%1" == "USE_APODMX" goto apodmx

if not exist ..\dmx\dmx33gs goto dmxerror
if not exist ..\dmx\dmx34a goto dmxerror
set USE_APODMX=0
goto task

:dmxerror
echo Can't recreate Heretic EXE, you need a compatible version of the
echo DMX headers under ..\dmx. You also need a compatible version of
echo the DMX library, again under ..\dmx.
echo Alternatively, run "DOBUILD.BAT USE_APODMX" to use APODMX instead.
goto end

:apodmx
if not exist ..\apodmx\apodmx.lib goto apodmxerror
REM AUDIO_WF.LIB is copied as a workaround for too long path
set USE_APODMX=1
goto task

:apodmxerror
echo Can't recreate Heretic EXE, you need the APODMX headers
echo and the APODMX.LIB file under ..\apodmx ready, as well
echo as ..\audiolib\origexes\109\AUDIO_WF.LIB.
goto end

:task
REM Since environment variables may actually impact the compiler output,
REM use a helper script in order to try and refrain from them

mkdir %TARGET%
echo wmake.exe %TARGET%\tic.exe "appver_exedef = %TARGET%" "use_apodmx = %USE_APODMX%" > BUILDTMP.BAT
echo del BUILDTMP.BAT >> BUILDTMP.BAT
set TARGET=
set USE_APODMX=
BUILDTMP.BAT

:end
set TARGET=
