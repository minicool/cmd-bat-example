@echo off
echo %date% %time% >> ping.log
echo --------ping network list---------->> ping.log
for /f "tokens=1,* delims= " %%i in (ip.txt) do (echo %%i %%j >> ping.log)
echo --------ping network result-------->> ping.log
for /f "tokens=1,* delims= " %%i in (ip.txt) do (ping -w 600 -n 1 %%j|find /i "ttl" && echo %%i %%j PING suceed>> ping.log || echo %%i %%j PING failed >> ping.log)
start ping.log