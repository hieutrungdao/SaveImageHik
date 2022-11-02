@echo off
title SaveImage

set base_dir=%~dp0
%base_dir:~0,2%
pushd %base_dir% 1>nul 2>&1

call .\src\JavaEnv.bat || goto:END

start python .\src\del_images.py

java -classpath ".\bin;.\src\MvCameraControlWrapper.jar;%CLASSPATH%" SaveImage

:END

popd
pause
