@echo off
title SaveImage

set base_dir=%~dp0
%base_dir:~0,2%
pushd %base_dir% 1>nul 2>&1

call .\src\JavaEnv.bat || goto:END

set SRC=.\src\SaveImage.java
if NOT exist .\bin\ (
      mkdir .\bin\
)

del /F/Q .\bin\* >nul 2>&1

echo compiling %SRC%
javac -sourcepath .\src\ ^
      -encoding utf-8 ^
      -classpath ".\src\MvCameraControlWrapper.jar;%CLASSPATH%"^
      -implicit:none ^
      -d .\bin ^
      %SRC%

:END
if %errorlevel% NEQ 0 (
    echo Compilation failure.
) else (
    echo Compilation success.
)

popd
pause