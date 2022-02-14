@if "%DEBUG%" == "" @echo on
@rem ##########################################################################
@rem
@rem  RAM support script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIR=%~dp0
if "%DIR%" == "" set DIR=.

if "start:frontend"=="%1" goto startFrontend
if "start:backend"=="%1" goto startBackend
if "db:seed"=="%1" goto dbSeed

echo Usage:  ram ( command ... )
echo commands:
echo   start:frontend             Starts local frontend server
echo   start:backend              Starts local backend server
echo
echo   db:seed                    Seeds local database
goto end


# START

:startFrontend
    echo "on"
    echo "Starting frontend"
    cd frontend
    gulp serve
    echo "on"
    goto end

:startBackend
    echo "on"
    echo "Starting backend"
    cd backend
    RAM_CONF=$DIR/backend/conf/conf-localhost.js
    gulp serve
    echo "on"
    goto end

# DB

:dbSeed
    echo "on"
    echo "Seeding database"
    echo "on"
    cd backend
    RAM_CONF=$DIR/backend/conf/conf-localhost.js
    gulp seed
    echo "on"
    goto end


:end