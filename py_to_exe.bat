@echo off
color 0a
cls
:::                _                        
:::               | |                       
:::  _ __  _   _  | |_ ___     _____  _____ 
::: | '_ \| | | | | __/ _ \   / _ \ \/ / _ \
::: | |_) | |_| | | || (_) | |  __/>  <  __/
::: | .__/ \__, |  \__\___/   \___/_/\_\___|
::: | |     __/ |                           
::: |_|    |___/             
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

echo:
set /P c=Name of the file (without the extension) ? 

pyinstaller --onefile %c%.py

RMDIR /S /Q "build"
RMDIR /S /Q "__pycache__"
move "dist\%c%.exe" "%cd%"
RMDIR /S /Q "dist"
del %c%.spec

cls
set /P c=delete the "py_to_exe" files [Y/N]?
if /I "%c%" EQU "Y" goto :delete
exit

:delete
del pyinstaller.exe
(goto) 2>nul & del "%~f0"