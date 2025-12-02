echo Installing the Mssdb...

git clone https://aur.archlinux.org/msodbcsql.git
cd msodbcsql && makepkg -si

cd ..
if [ ! -d "mssql-tools" ]; then
 git clone https://aur.archlinux.org/mssql-tools.git
 cd mssql-tools && makepkg -si
 cd ..
else
 echo "mssql-tools directory already exists, skipping clone and build."
fi



yay -S mssql-tools mssql-server

sudo /opt/mssql/bin/mssql-conf setup
# please find pleace to add something

sudo systemctl enable mssql-server
sudo systemctl start mssql-server

echo any bugs bro please chck the setup
