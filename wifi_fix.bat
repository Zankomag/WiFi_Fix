set WIFI_ADAPTER_NAME = "Wi-Fi 3"
netsh wlan set autoconfig interface=%WIFI_ADAPTER_NAME% enabled=yes
timeout /t 180
netsh wlan set autoconfig interface=%WIFI_ADAPTER_NAME% enabled=no
timeout /t 5
exit