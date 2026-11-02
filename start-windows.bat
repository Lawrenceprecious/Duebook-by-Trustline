@echo off
setlocal
cd /d "%~dp0"
echo ========================================
echo   DueBook by Trustline - Windows setup
echo ========================================
echo.
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js was not found. Install the current Node.js LTS release, then reopen this file.
  pause
  exit /b 1
)
if not exist "backend\.env" (
  copy "backend\.env.example" "backend\.env" >nul
  echo Created backend\.env from the example.
  echo IMPORTANT: Edit backend\.env and set MONGODB_URI and a JWT_SECRET of at least 32 characters.
  echo The app cannot connect to its database until you do this.
  notepad "backend\.env"
  pause
  exit /b 0
)
echo Installing backend dependencies...
cd backend
call npm install
if errorlevel 1 (echo Dependency installation failed.& pause & exit /b 1)
start "DueBook API" cmd /k "npm start"
cd ..
echo.
echo Frontend files are static HTML. Start a local static server in the project root.
echo Recommended: in VS Code, install Live Server, then right-click index.html and choose Open with Live Server.
echo The default backend CORS origin is http://localhost:5500. If Live Server uses another port, update FRONTEND_ORIGIN in backend\.env.
echo.
pause
