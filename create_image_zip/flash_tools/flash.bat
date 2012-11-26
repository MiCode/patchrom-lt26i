@echo off
echo.
echo 关机，按 音量键上 连接到电脑进入fastboot模式（蓝灯亮）
echo.
echo  是否刷入data.img
echo 【注意】
echo       刷入data.img会造成DATA用户数据丢失，请提前做好备份
echo       第一次刷MIUI需要刷写DATA分区，否则不能正常启动，之后可不刷
choice /m "Y-刷写  N-不刷写 C-退出刷机" /c:YNC
if errorlevel 3 goto cancel
if errorlevel 2 goto flash_system
if errorlevel 1 goto flash_userdata

:flash_userdata
echo.
echo 刷入 data.img ...
fastboot erase userdata >nul
fastboot flash userdata data.img >nul

:flash_system
echo.
echo 刷入 system.img ...
fastboot flash system system.img >nul

:flash_boot
echo.
echo 刷入 boot(ics16.ief) ...
fastboot flash boot ics16.elf >nul

:flash_done
echo.
echo 刷机完成
goto end

:cancel
echo.
echo 您已取消刷机

:end
echo 按任意键手机将自动重启,请拔出数据线,等待开机
pause >nul
fastboot reboot >nul