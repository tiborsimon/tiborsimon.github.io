@echo off
set /p MESSAGE="Commit message: "
git add --all
git commit -m "%MESSAGE%"
git push origin
