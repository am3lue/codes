echo Installing the Mssdb...

git clone https://aur.archlinux.org/msodbcsql.git
cd msodbcsql && makepkg -si

cd ..

git clone https://aur.archlinux.org/mssql-tools.git
cd mssql-tools && makepkg -si 

installing the mssql-tools
cd ..



yay -S mssql-tools mssql-server

sudo /opt/mssql/bin/mssql-conf setup

sudo systemctl enable mssql-server
sudo systemctl start mssql-server

echo any bugs bro please chck the setup
