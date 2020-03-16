::script has 2 part - functions and core script


goto :corescript

:: functions 
:exitnotestcomp
echo %time% %date% no test comp - exit >> %logfile%
goto :eof

:checkopsiclientd
echo %time% %date% no winst32.exe - we in checkopsiclientd >> %logfile%
if not exist "C:\Program Files (x86)\opsi.org\opsi-client-agent\opsiclientd.exe" goto :startwinst

:startwinst
echo %time% %date% no opsiclientd - we in startwinst >> %logfile%



net use J: \\%depotip%\opsi_depot /user:%adminuser% %depotpassword% /Persistent:No
J:
cd opsi-client-agent
call service_setup.cmd /u 
goto :eof

:noexistwinst32
echo %time% %date% no winst32.exe >> %logfile%
goto :afternoexistwinst32

:noexistopsiclientd
echo %time% %date% no opsiclientd >> %logfile%
goto :afternoexistopsiclientd




:: core script 
:corescript

SET "logfile=C:\Windows\Temp\opsisetup.log"
SET "depotip=192.168.0.10"
SET "depotuser=adminuser"
SET "depotpassword=gmslerkmglekrg4656u945sirhgehb"

::uncomment this if you want testing only on test computer with computername "TESTCLIENT"
::echo 1 > C:\Windows\Temp\%COMPUTERNAME%
::if not exist C:\Windows\Temp\TESTCLIENT goto :exitnotestcomp

echo %time% %date% start exploring>> %logfile%


if not exist "C:\Program Files (x86)\opsi.org\opsi-client-agent\opsi-winst\winst32.exe" goto :checkopsiclientd
echo %time% %date% winst32 exist>> %logfile%
