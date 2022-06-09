Echo "04_Create_list_of_users_v01.bat"
pause

net localgroup users > users_group_members.txt

Echo Remove current administrators

for /f %%A in (valid_Admin_list.txt) do (
   echo Now performing %%A
   find /V "%%A" users_group_members.txt  > temp_users_group_members.txt
   copy /Y temp_users_group_members.txt users_group_members.txt
)


for /f %%A in (text_to_remove_from_User_Group_list.txt) do (
   echo Now performing %%A
   find /V "%%A" users_group_members.txt  > temp_users_group_members.txt
   copy /Y temp_users_group_members.txt users_group_members.txt
)



del /Q temp_users_group_members.txt 
type users_group_members.txt
