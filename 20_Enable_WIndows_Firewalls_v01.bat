Echo "10_Enable_Windows_Firewalls_v01.bat"
pause

netsh advfirewall set currentprofile state on
netsh advfirewall set privateprofile state on
netsh advfirewall set publicprofile state on

Pause
