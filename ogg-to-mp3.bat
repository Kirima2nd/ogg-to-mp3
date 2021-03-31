@echo off

echo.
echo ======================
echo  OGG to MP3 Converter
echo ======================
echo. 
echo Please wait while we convert your files
echo Make sure you have put *.ogg inside ogg folder
echo Otherwise it won't work!
echo.
echo.
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=y32 || set OS=y64
if %OS%==y32 for /f %%i IN ('dir /b /s "lul\*.ogg"') do call "ffmpeg.x86.exe" -i "%%i" -vn "%%i.mp3" > log.txt
if %OS%==y64 for /f %%i IN ('dir /b /s "lul\*.ogg"') do call "ffmpeg.exe" -i "%%i" -vn "%%i.mp3" > log.txt
echo.
echo Deleting files...
del "ogg\*.ogg"
