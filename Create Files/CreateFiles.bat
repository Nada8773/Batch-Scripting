@echo off

setlocal enabledelayedexpansion

set count=0
set count1=0
set count2=0


for /F "tokens=1-4" %%a in (input.txt) do (
REM Create Folder if it does not already exist
IF Not EXIST %%a (
MKDIR %%a
)
CD %%a

if EXIST %%b (
set /p count=<%%b
set /a count=!count!+1
ECHO !count! > %%b
)else (
REM write 0 to the file
ECHO 0 > %%b
)


if EXIST %%c (
set /p count1=<%%c
set /a count1=!count1!+1
ECHO !count1! > %%c
)else (
ECHO 0 > %%c
)

if EXIST %%d (
set /p count2=<%%d
set /a count2=!count2!+1
ECHO !count2! > %%d
)else (
ECHO 0 > %%d
)

CD..
IF Not EXIST TextFiles     ( MKDIR TextFiles )
IF Not EXIST SourceFiles   ( MKDIR SourceFiles )
IF Not EXIST HeadertFiles  ( MKDIR HeadertFiles )

COPY %CD%\%%a\*.txt  %CD%\TextFiles\
COPY %CD%\%%a\*.c  %CD%\SourceFiles\
COPY %CD%\%%a\*.h  %CD%\HeadertFiles\


)
goto END
:INVALIDINPUT
echo "invalid input"
:END
