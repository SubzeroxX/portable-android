if exist jdk-21.0.6_windows-x64_bin.zip goto cmdtools
wget https://download.oracle.com/java/21/archive/jdk-21.0.6_windows-x64_bin.zip
:cmdtools
if exist commandlinetools-win-13114758_latest.zip goto :prepare
wget https://dl.google.com/android/repository/commandlinetools-win-13114758_latest.zip

:prepare
powershell -command "Expand-Archive -Force %cd%\jdk-21.0.6_windows-x64_bin.zip %cd% "
powershell -command "Expand-Archive -Force %cd%\commandlinetools-win-13114758_latest.zip %cd% "
cd cmdline-tools
if exist latest/ goto eof
mkdir latest
move bin latest/
move lib latest/
move NOTICE.txt latest/
move source.properties latest/
:eof
cd ..