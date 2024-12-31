@echo off
setlocal EnableDelayedExpansion

REM Set the input file containing URLs or search terms
set input_file=inputs.txt

REM Check if the input file exists
if not exist %input_file% (
    echo ERROR101: 'inputs.txt' not found. Please create the file and add your inputs.
    echo Press any key to exit...
    pause
    exit
)

REM Initialize a counter to track the number of opened tabs
set /a num_tabs=0
echo Starting search...

REM Loop through each line in the input file
REM Each line represents a search term or URL to process
for /f "delims=;" %%a in (%input_file%) do (
    REM Assign the current line to the 'search_term' variable
    set "search_term=%%a"
    
    REM Remove any spaces from the search term
    set "search_term=!search_term: =!"  

    REM Log the current search term to the console
    echo Searching for "!search_term!"...
    
    REM Open the search term or URL in an incognito Chrome tab
    start chrome.exe -incognito "!search_term!"

    REM Increment the tab counter
    set /a num_tabs+=1

    REM Pause after 10 tabs to prevent overloading the browser
    if !num_tabs! geq 10 (
        echo Pausing after 10 tabs. Press any key to continue...
        pause
        set num_tabs=0
    )
)

REM Notify the user that all searches are done
echo Done.
pause
