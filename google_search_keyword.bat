@echo off
setlocal EnableDelayedExpansion

REM Input file containing search terms
set input_file=inputs.txt

REM Check if the input file exists, and prompt the user to create it if not
if not exist "%input_file%" (
    echo ERROR101: 'inputs.txt' not found. Please create the file, add your search terms, and try again.
    pause
    exit
)

REM Initialize the tab counter
set /a num_tabs=0

REM Count the total number of lines in the input file
for /f %%c in ('find /c /v "" %input_file%') do set total_tabs=%%c

REM Process each line in the input file
for /f %%a in (%input_file%) do (
    REM Open the search query in an incognito browser tab
    start msedge --inprivate "https://www.google.com/search?q=%%a"
    
    REM Increment the tab counter
    set /a num_tabs+=1

    REM Pause after every 10 tabs to prevent overloading the browser
    if !num_tabs! geq 10 (
        echo Pausing to prevent overload. Press any key to continue...
        pause
        set /a num_tabs=0
    )
)

echo All searches completed. Total tabs opened: %total_tabs%.
pause
