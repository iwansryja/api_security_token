##PHP 8.2

sudo apt update && sudo apt -y upgrade
sudo apt autoremove

[ -f /var/run/reboot-required ] && sudo reboot -f

sudo apt update
sudo apt install -y lsb-release gnupg2 ca-certificates apt-transport-https software-properties-common

sudo add-apt-repository ppa:ondrej/php
sudo apt update

sudo apt install php8.2

php --version

sudo apt install php8.2-{bcmath,fpm,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi}

sudo apt-get update
sudo apt-get install -y alien wget

wget -nv  https://download.oracle.com/otn_software/linux/instantclient/2110000/oracle-instantclient-devel-21.10.0.0.0-1.el8.x86_64.rpm
wget -nv  https://download.oracle.com/otn_software/linux/instantclient/2110000/oracle-instantclient-basic-21.10.0.0.0-1.el8.x86_64.rpm

sudo alien -i oracle-instantclient*-basic-*.rpm
sudo alien -i oracle-instantclient*-devel-*.rpm

 
 It installed to:
# /usr/lib/oracle/21/client64
# /usr/lib/oracle/21/client64/lib
sudo sh -c 'echo "env[ORACLE_HOME] = /usr/lib/oracle/21/client64" >> /etc/php/8.2/fpm/pool.d/www.conf'
sudo sh -c 'echo "env[LD_LIBRARY_PATH] = /usr/lib/oracle/21/client64/lib" >> /etc/php/8.2/fpm/pool.d/www.conf'
sudo service php8.2-fpm restart

sudo apt install php-pear 

echo 'install oci8'
printf "\n" | sudo pecl install oci8

echo 'add oci8 extension to php.ini'
sudo sh -c 'echo "extension=oci8.so" >> /etc/php/8.2/fpm/php.ini'
sudo service php8.2-fpm restart

echo 'install pdo oci'
wget -nv https://www.php.net/distributions/php-8.2.8.tar.gz
tar xzf php-8.2.8.tar.gz
cd php-8.2.8/ext/pdo_oci
sudo phpize
sudo ./configure --with-pdo-oci=instantclient,/usr,21
sudo make 
sudo make install

echo 'add pdo oci extension to php.ini'
sudo sh -c 'echo "extension=pdo_oci.so" >> /etc/php/8.2/fpm/php.ini'
sudo service php8.2-fpm restart
