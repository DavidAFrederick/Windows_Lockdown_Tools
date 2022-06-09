Echo "03_Identify_UnAuthorized_users_v01.bat"
pause

net localgroup users > users_group_members.txt

Echo "Remove valid administrators"

for /f %%A in (valid_Admin_list.txt) do (
   echo Now performing %%A
   find /V "%%A" users_group_members.txt  > temp_users_group_members.txt
   copy /Y temp_users_group_members.txt users_group_members.txt
)

Echo "Remove valid users" 

for /f %%A in (valid_User_list.txt) do (
   echo Now performing %%A
   find /V "%%A" users_group_members.txt  > temp_users_group_members.txt
   copy /Y temp_users_group_members.txt users_group_members.txt
)


for /f %%A in (text_to_remove_from_User_Group_list.txt) do (
   echo Now performing %%A
   find /V "%%A" users_group_members.txt  > temp_users_group_members.txt
   copy /Y temp_users_group_members.txt users_group_members.txt
)

copy /Y users_group_members.txt unauthorized_users.txt

del /Q temp_users_group_members.txt 

type unauthorized_users.txt

ECHO "MANAULLY Delete unauthorized users"
ECHO "Use the command: net user username /delete"

