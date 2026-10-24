@echo off
chcp 65001 >nul
echo Instalando o Kit Claude...
set "DEST=%USERPROFILE%\.claude"
if not exist "%DEST%\skills" mkdir "%DEST%\skills"
xcopy /E /I /Y "%~dp0skills" "%DEST%\skills" >nul
echo  - Skills copiadas para %DEST%\skills
if exist "%DEST%\CLAUDE.md" (
  echo  - Voce ja tem um CLAUDE.md. Nao mexi nele: abra o CLAUDE.md do kit e copie o que quiser.
) else (
  copy "%~dp0CLAUDE.md" "%DEST%\CLAUDE.md" >nul
  echo  - CLAUDE.md copiado. Abra e troque o que estiver entre ^<^>.
)
echo.
where npx >nul 2>&1
if errorlevel 1 (
  echo  - REA (engenharia reversa^) precisa do Node.js: instale em https://nodejs.org e rode "npx rea-agents setup".
) else (
  set /p REA="Instalar o REA (engenharia reversa)? [S/N] "
  if /i "%REA%"=="S" npx -y rea-agents setup
)
echo Pronto! Reinicie o Claude Code.
pause
