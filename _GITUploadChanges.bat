@echo off
echo *****************************************************************************
echo * GIT Upload to https://github.com/robinwilson16/SSRS-HartlepoolCollegeOfFE *
echo *****************************************************************************
echo .
echo Deleting any temp data files generated from previewing reports...
DEL /S /Q *.data
echo .
echo Adding files to repository...
git add .
set /p changes="Enter Brief Details of Change: "
git commit -m "%changes%"
git pull
git push
pause