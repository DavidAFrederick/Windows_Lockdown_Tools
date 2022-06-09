Echo "01_Identify_Invalid_Admins_v01.bat"
pause

net localgroup administrators > admin_group_members.txt

copy /Y admin_group_members.txt  list_of_INVALID_admins.txt

for /f %%A in (valid_Admin_list.txt) do (
   echo Now performing %%A
   find /V "%%A" list_of_INVALID_admins.txt  > temp_list_of_INVALID_admins.txt
   copy temp_list_of_INVALID_admins.txt list_of_INVALID_admins.txt
)

for /f %%A in (text_to_remove_from_Admin_list.txt) do (
   echo Now performing %%A
   find /V "%%A" list_of_INVALID_admins.txt  > temp_list_of_INVALID_admins.txt
   copy temp_list_of_INVALID_admins.txt list_of_INVALID_admins.txt
)


del /Y temp_list_of_INVALID_admins.txt
type list_of_INVALID_admins.txt
