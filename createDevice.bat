call activate
call setupDependencies
call sdkmanager emulator platform-tools
cls
for /f %%i in ('call sdkmanager --list ^| findstr /i "system-images;android-" ^| sort') do echo %%i

echo:
echo:
echo output scheme:
echo system-images;android-{api-level};{type};{arch}

echo Api Level:
set /p apilevel=
echo Type: [google_apis google_apis_playstore default]
set /p type=
echo Arch: [x86_64 arm64-v8a]
set /p arch=
echo Dev name:
set /p name=
call sdkmanager "build-tools;%apilevel%.0.0" "platforms;android-%apilevel%"
call sdkmanager "system-images;android-%apilevel%;%type%;%arch%"
call avdmanager list device

echo Device id/name:
set /p device=
mkdir devices
call avdmanager create avd -n %name% -k "system-images;android-%apilevel%;%type%;%arch%" -d %device% -p devices\%name%
mkdir .android\avd

echo cd .. ^&^& call ..\activate.bat ^&^& emulator -avd "%name%" > devices\%name%_start.bat