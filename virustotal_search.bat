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

    REM Skip empty lines
    if "!input!"=="" (
        echo Skipping empty line...
        goto :continue
    )

    echo Processing "!input!"...

    REM Check if it's an IP address (numeric with dots)
    echo !input! | findstr /r "^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*$" >nul && (
        echo Recognized as an IP address.
        start msedge.exe -inprivate "https://www.virustotal.com/gui/ip-address/!input!"
        goto :continue
    )

    REM Check if it's a domain (contains at least one dot and not just an IP)
    echo !input! | findstr /r "^[a-zA-Z0-9-]*\.[a-zA-Z0-9-.]*$" >nul && (
        echo Recognized as a domain.
        start msedge.exe -inprivate "https://www.virustotal.com/gui/domain/!input!"
        goto :continue
    )

    REM Otherwise, treat it as a hash
    echo Recognized as a hash.
    start msedge.exe -inprivate "https://www.virustotal.com/gui/file/!input!"

    :continue
    set /a num_tabs+=1

    REM Pause after 20 tabs to prevent overloading the browser
    if !num_tabs! geq 20 (
        echo Reached 20 tabs. Press any key to continue...
        pause
        set /a num_tabs=0
    )
)

echo All inputs processed. Exiting...
pause
exit
