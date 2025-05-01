@echo off
echo Starting file synchronization...
echo Source: E:\rules\my-rules
echo Destination: C:\Users\Tam\.codeium\windsurf\memories

:: Run robocopy with the /IT switch
robocopy "E:\rules\my-rules" "C:\Users\Tam\.codeium\windsurf\memories" /IT

:: Check the error level to display a meaningful message
:: Robocopy uses specific error codes for different scenarios
if %ERRORLEVEL% EQU 0 echo Synchronization completed successfully. No files were copied.
if %ERRORLEVEL% EQU 1 echo Synchronization completed successfully. Files were copied.
if %ERRORLEVEL% EQU 2 echo Synchronization completed with some extra files or directories detected.
if %ERRORLEVEL% EQU 3 echo Some files were copied. Additional files were present. No failure was encountered.
if %ERRORLEVEL% GEQ 8 echo At least one file could not be copied. Check the log for details.

echo.
echo Synchronization process completed.
pause