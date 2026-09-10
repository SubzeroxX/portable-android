call activate
call setupDependencies
call sdkmanager emulator platform-tools
cls
call sdkmanager --list
echo Api Level:
set /p apilevel=
echo Type: [google_apis google_apis_playstore default]
set /p type=
echo Arch: [x86 x86_64]
set /p arch=
echo Dev name:
set /p name=
call sdkmanager "build-tools;%apilevel%.0.0" "platforms;android-%apilevel%"
call sdkmanager "system-images;android-%apilevel%;%type%;%arch%"
call avdmanager list device

set /p device=
mkdir devices
call avdmanager create avd -n %name% -k "system-images;android-%apilevel%;%type%;%arch%" -d %device% -p devices\%name%
mkdir .android\avd
rem move %name%.ini .android\avd\%name%.ini
echo "cd .. && call ..\activate.bat && emulator -avd %name%" > devices\%name%_start.bat