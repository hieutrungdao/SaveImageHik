@echo off

set /A errorcode=0

setlocal ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION

echo > tmp
if exist tmp (
    del /F/Q tmp >nul 2>&1
) else (
    echo Please switch to an administrator account to run this batch!!!
    set /A errorcode=1
    goto:END
)

if "%JAVA_HOME%"=="" (
    echo JAVA_HOME not set. Please make sure that java is correctly installed.
    set /A errorcode=2
    goto:END
)

if "%CLASSPATH%"=="" (
    echo CLASSPATH not set. Please make sure that java is correctly installed.
    set /A errorcode=3
    goto:END
)

java -version >nul 2> JavaVer.tmp
for /F "tokens=1,2,3*" %%i in (JavaVer.tmp) do (
    if "%%j" == "version" (
        if %%k LSS "1.7.0" (
            echo Java version is less than "1.7.0", warnings or errors may occur.
        )
    )
)
del /F/Q JavaVer.tmp >nul 2>&1

:END

exit /B %errorcode%
