Echo "02_Remove_invalid_Admins_From_Group.bat"
pause

Echo "Verify the list of Invalid Admins,   Control-C to abort"
type list_of_INVALID_admins.txt

pause
Pause


for /f %%A in (list_of_INVALID_admins.txt) do (
   echo Now performing %%A
   net localgroup administrators %%A /delete
)
