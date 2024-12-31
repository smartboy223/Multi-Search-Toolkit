@echo off
setlocal EnableDelayedExpansion

REM Input file containing hashes, IPs, or domains
set input_file=inputs.txt

REM Check if the input file exists
if not exist %input_file% (
    echo ERROR: inputs.txt not found. Please create the file with your data and try again.
    pause
    exit
)

REM Counter for opened tabs
set /a num_tabs=0

REM Start processing each line in the input file
for /f "delims=" %%a in (%input_file%) do (
    set "input=%%a"
    set "input=!input: =!"  REM Remove spaces from the input

    REM Determine the input type
    if "!input!"=="" (
        echo Skipping empty line...
        goto :continue
    )

    echo Processing "!input!"...

    REM Check if it's an IP address
    for /f "tokens=1-4 delims=." %%i in ("!input!") do (
        if "%%i" neq "" if "%%j" neq "" if "%%k" neq "" if "%%l" neq "" (
            echo Recognized as an IP address.
            start msedge.exe -inprivate "https://www.virustotal.com/gui/ip-address/!input!"
            goto :continue
        )
    )

    REM Check if it's a domain (contains a dot but not just an IP-like structure)
    echo !input! | findstr /r "^.*\..*$" >nul && (
        echo Recognized as a domain.
        start msedge.exe -inprivate "https://www.virustotal.com/gui/domain/!input!"
        goto :continue
    )

    REM Otherwise, treat it as a hash
    echo Recognized as a hash.
    start msedge.exe -inprivate "https://www.virustotal.com/gui/file/!input!"

    :continue
    set /a num_tabs+=1

    REM Pause after 50 tabs to prevent overloading the browser
    if !num_tabs! geq 50 (
        echo Reached 50 tabs. Press any key to continue...
        pause
        set /a num_tabs=0
    )
)

echo All inputs processed. Exiting...
pause
exit
