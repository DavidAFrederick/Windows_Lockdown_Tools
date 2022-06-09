Echo "05_change_users_passwords_v01.bat"
pause

type users_group_members.txt

echo "Double check the user list before changing the passwords"
pause
pause

echo > log_randomly_created_passwords.txt 

for /f %%A in (users_group_members.txt) do (
   echo Now performing %%A
   net user %%A /random >> log_randomly_created_passwords.txt 
)


find "Password" log_randomly_created_passwords.txt > log_randomly_created_passwords_readable.txt

type log_randomly_created_passwords_readable.txt

