#!/bin/sh
apt update -y
apt install vsftpd -y
service vsftpd start;
adduser --gecos "" $ftp_username
echo "$ftp_username:$ftp_pwd" | chpasswd
mkdir -p /home/$ftp_username/ftp
chown -R "$ftp_username:$ftp_username" /home/$ftp_username/ftp
echo 'anonymous_enable=NO' >> /etc/vsftpd.conf;
echo 'local_enable=YES' >> /etc/vsftpd.conf;
echo 'write_enable=YES' >> /etc/vsftpd.conf;
echo 'chroot_local_user=YES' >> /etc/vsftpd.conf;
echo "user_sub_token=$ftp_username" >> /etc/vsftpd.conf;
echo "local_root=/home/$ftp_username/ftp" >> /etc/vsftpd.conf;
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;
echo "pasv_min_port=40000" >> /etc/vsftpd.conf;
echo "pasv_max_port=40005" >> /etc/vsftpd.conf;
echo "userlist_enable=YES" >> /etc/vsftpd.conf;
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf;
echo "userlist_deny=NO" >> /etc/vsftpd.conf;
echo "$ftp_username" | tee -a /etc/vsftpd.userlist;
service vsftpd stop;
/usr/sbin/vsftpd