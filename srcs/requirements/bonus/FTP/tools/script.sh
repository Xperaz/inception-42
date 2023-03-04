#!/bin/sh

adduser --gecos "" $ftp_user 
echo "$ftp_user:$ftp_pwd" | chpasswd
mkdir -p /home/$ftp_user/ftp
chown -R "$ftp_user:$ftp_user" /home/$ftp_user/ftp
echo "user_sub_token=$ftp_user" >> /etc/vsftpd.conf;
echo "local_root=/home/$ftp_user/ftp" >> /etc/vsftpd.conf;
echo "$ftp_user" | tee -a /etc/vsftpd.userlist;

exec "$@"