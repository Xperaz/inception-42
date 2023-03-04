#!/bin/sh

adduser --gecos "" $ftp_user
echo "$ftp_user:$ftp_pwd" | chpasswd
mkdir -p /home/$ftp_user/ftp
chown -R "$ftp_user:$ftp_user" /home/$ftp_user/ftp
echo 'anonymous_enable=NO' >> /etc/vsftpd.conf;
echo 'local_enable=YES' >> /etc/vsftpd.conf;
echo 'write_enable=YES' >> /etc/vsftpd.conf;
echo 'chroot_local_user=YES' >> /etc/vsftpd.conf;
echo "user_sub_token=$ftp_user" >> /etc/vsftpd.conf;
echo "local_root=/home/$ftp_user/ftp" >> /etc/vsftpd.conf;
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;
echo "pasv_min_port=40000" >> /etc/vsftpd.conf;
echo "pasv_max_port=40005" >> /etc/vsftpd.conf;
echo "userlist_enable=YES" >> /etc/vsftpd.conf;
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf;
echo "userlist_deny=NO" >> /etc/vsftpd.conf;
echo "$ftp_user" | tee -a /etc/vsftpd.userlist;

exec "$@"