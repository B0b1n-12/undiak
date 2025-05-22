@echo off
set SOURCE=main.cpp
set OUTPUT=convert.exe

REM Preklad pomoci g++
echo 🔧 Preklad souboru %SOURCE%...
g++ -std=c++17 -o %OUTPUT% %SOURCE%
if %errorlevel%==0 (
    echo ✅ Preklad hotov. Spoustim program:
    echo -------------------------
    %OUTPUT%
) else (
    echo ❌ Chyba pri překladu!
)
pause
