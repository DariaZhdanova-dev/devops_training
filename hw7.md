# 1 - Repositories and Packages
## rpm
### 1) Download sysstat package.

[dasha@localhost ~]$ `wget http://mirror.centos.org/centos/7/os/x86_64/Packages/sysstat-10.1.5-19.el7.x86_64.rpm`

--2021-12-25 19:08:25--  http://mirror.centos.org/centos/7/os/x86_64/Packages/sysstat-10.1.5-19.el7.x86_64.rpm  
Resolving mirror.centos.org (mirror.centos.org)... 152.89.62.228, 2a02:2658:1056:0:222:19ff:fed6:7c99  
Connecting to mirror.centos.org (mirror.centos.org)|152.89.62.228|:80... connected.  
HTTP request sent, awaiting response... 200 OK  
Length: 323020 (315K) [application/x-rpm]  
Saving to: ‘sysstat-10.1.5-19.el7.x86_64.rpm’  

100%[==============================================================================>] 323,020     1.12MB/s   in 0.3s  

2021-12-25 19:08:25 (1.12 MB/s) - ‘sysstat-10.1.5-19.el7.x86_64.rpm’ saved [323020/323020]  

### 2) Get information from downloaded sysstat package file.

[dasha@localhost ~]$ `rpm -qip sysstat-10.1.5-19.el7.x86_64.rpm`

Name        : sysstat  
Version     : 10.1.5  
Release     : 19.el7  
Architecture: x86_64  
Install Date: (not installed)  
Group       : Applications/System  
Size        : 1172488  
License     : GPLv2+  
Signature   : RSA/SHA256, Sat 04 Apr 2020 12:08:48 AM MSK, Key ID 24c6a8a7f4a80eb5  
Source RPM  : sysstat-10.1.5-19.el7.src.rpm  
Build Date  : Wed 01 Apr 2020 07:36:37 AM MSK  
Build Host  : x86-01.bsys.centos.org  
Relocations : (not relocatable)  
Packager    : CentOS BuildSystem <http://bugs.centos.org>  
Vendor      : CentOS  
URL         : http://sebastien.godard.pagesperso-orange.fr/  
Summary     : Collection of performance monitoring tools for Linux  
Description :  

### 3) Install sysstat package and get information about files installed by this package.

[dasha@localhost dasha]# `rpm -ivh sysstat-10.1.5-19.el7.x86_64.rpm --nodeps && rpm -ql sysstat`

Preparing...                          ################################# [100%]  
Updating / installing...  
   1:sysstat-10.1.5-19.el7            ################################# [100%]  
/etc/cron.d/sysstat  
/etc/sysconfig/sysstat  
/etc/sysconfig/sysstat.ioconf  
/usr/bin/cifsiostat  
/usr/bin/iostat  
/usr/bin/mpstat  
...
/usr/share/man/man1/sar.1.gz  
/usr/share/man/man1/tapestat.1.gz  
/usr/share/man/man5/sysstat.5.gz  
/usr/share/man/man8/sa1.8.gz  
/usr/share/man/man8/sa2.8.gz  
/usr/share/man/man8/sadc.8.gz  
/var/log/sa  

## yum
### 0) Add NGINX repository
[dasha@localhost yum.repos.d]# `cat nginx.repo`  
[nginx-stable]  
name=nginx stable repo  
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/  
gpgcheck=1  
enabled=1  
gpgkey=https://nginx.org/keys/nginx_signing.key  
module_hotfixes=true  

[nginx-mainline]  
name=nginx mainline repo  
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/  
gpgcheck=1  
enabled=0  
gpgkey=https://nginx.org/keys/nginx_signing.key  
module_hotfixes=true  

### 1) Check if NGINX repository enabled or not.

[dasha@localhost yum.repos.d]# `yum repolist | grep nginx`
nginx-stable/7/x86_64   nginx stable repo                                    256  

### 2) Install NGINX. 

[dasha@localhost yum.repos.d]# `yum install nginx`  
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-manager  

This system is not registered with an entitlement server. You can use subscription-manager to register.  

Loading mirror speeds from cached hostfile  
 * base: mirror.sale-dedic.com  
 * epel: fedora-epel.koyanet.lv  
 * extras: mirror.sale-dedic.com  
 * updates: mirror.sale-dedic.com  
nginx-stable                                                                                     | 2.9 kB  00:00:00  
Resolving Dependencies  
--> Running transaction check  
---> Package nginx.x86_64 1:1.20.2-1.el7.ngx will be installed  
--> Finished Dependency Resolution  

Dependencies Resolved  

...

Complete!
[dasha@localhost yum.repos.d]# `nginx -v`  
nginx version: nginx/1.20.2

### 3) Check yum history and undo NGINX installation.  

[dasha@localhost yum.repos.d]# `yum history`  
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-manager  

This system is not registered with an entitlement server. You can use subscription-manager to register.  

ID     | Login user               | Date and time    | Action(s)      | Altered
-------------------------------------------------------------------------------
    26 | root <root>              | 2021-12-25 19:35 | Install        |    1 E<
    25 | root <root>              | 2021-12-25 18:18 | Install        |    1 >
    24 | root <root>              | 2021-12-25 18:12 | Install        |    1  <
    23 | root <root>              | 2021-12-25 18:01 | Erase          |    1 >
    22 | root <root>              | 2021-12-25 17:56 | Install        |    1 EE
    21 | root <root>              | 2021-12-25 17:55 | Install        |    4
    20 | root <root>              | 2021-12-25 17:54 | Install        |    3  <
    19 | root <root>              | 2021-12-25 17:43 | Install        |    1 >
    18 | root <root>              | 2021-12-21 11:19 | Install        |    1
    17 | root <root>              | 2021-12-21 10:58 | Install        |    1
    16 |  <dasha>                 | 2021-12-13 02:32 | Install        |    8
    15 |  <dasha>                 | 2021-12-13 02:27 | Update         |    3
    14 |  <dasha>                 | 2021-12-11 20:49 | Install        |    1
    13 |  <dasha>                 | 2021-12-10 02:53 | Install        |   33
    12 |  <dasha>                 | 2021-12-06 03:38 | Install        |    3
    11 | root <root>              | 2021-12-06 01:40 | Install        |    1
    10 | root <root>              | 2021-12-06 00:23 | Install        |  101
     9 | root <root>              | 2021-12-06 00:15 | Install        |    6
     8 | root <root>              | 2021-12-06 00:14 | Install        |    1
     7 | root <root>              | 2021-12-06 00:09 | Install        |    3
history list  
[dasha@localhost yum.repos.d]# `yum history undo 26`  
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-manager  

This system is not registered with an entitlement server. You can use subscription-manager to register.  

Undoing transaction 26, from Sat Dec 25 19:35:19 2021  
    Install nginx-1:1.20.2-1.el7.ngx.x86_64 @nginx-stable  
Resolving Dependencies  
--> Running transaction check  
---> Package nginx.x86_64 1:1.20.2-1.el7.ngx will be erased  
--> Finished Dependency Resolution  

Dependencies Resolved  
...  
Complete!    

[dasha@localhost yum.repos.d]# `nginx -v`  
-bash: /usr/sbin/nginx: No such file or directory  

### 4) Disable NGINX repository.

[dasha@localhost yum.repos.d]# `yum-config-manager --disable nginx-stable`  
Loaded plugins: fastestmirror, product-id, subscription-manager  
 
This system is not registered with an entitlement server. You can use subscription-manager to register.  

================================================== repo: nginx-stable ==================================================  
[nginx-stable]  
async = True  
bandwidth = 0  
base_persistdir = /var/lib/yum/repos/x86_64/7  
baseurl = http://nginx.org/packages/centos/7/x86_64/  
cache = 0  
cachedir = /var/cache/yum/x86_64/7/nginx-stable  
check_config_file_age = True  
compare_providers_priority = 80  
cost = 1000  
deltarpm_metadata_percentage = 100  
deltarpm_percentage =  
enabled = 0  
...

[dasha@localhost yum.repos.d]# `yum repolist all | grep nginx`  
nginx-mainline/7/x86_64             nginx mainline repo          disabled  
nginx-stable/7/x86_64               nginx stable repo            disabled  

### 5) Remove sysstat package installed in the first task.

[root@localhost yum.repos.d]# `rpm -e sysstat`  

### 6, 7) Install EPEL repository and get information about it. 

[root@localhost yum.repos.d]# `yum -y install epel-release`  
[root@localhost yum.repos.d]# `yum repoinfo epel`  
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-manager  

This system is not registered with an entitlement server. You can use subscription-manager to register.  

Loading mirror speeds from cached hostfile  
 * base: mirror.sale-dedic.com  
 * epel: www.nic.funet.fi  
 * extras: mirror.sale-dedic.com  
 * updates: mirror.sale-dedic.com  
Repo-id      : epel/x86_64  
Repo-name    : Extra Packages for Enterprise Linux 7 - x86_64  
Repo-status  : enabled  
Repo-revision: 1640393346  
Repo-updated : Sat Dec 25 03:56:38 2021  
Repo-pkgs    : 13,703  
Repo-size    : 16 G  
Repo-metalink: https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=x86_64  
  Updated    : Sat Dec 25 03:56:38 2021  
Repo-baseurl : http://www.nic.funet.fi/pub/mirrors/fedora.redhat.com/pub/epel/7/x86_64/ (94 more)  
Repo-expire  : 21,600 second(s) (last: Sat Dec 25 18:14:03 2021)   
  Filter     : read-only:present   
Repo-filename: /etc/yum.repos.d/epel.repo  
  
repolist: 13,703  

### 8) Install ncdu package from EPEL repo.
 
[dasha@localhost yum.repos.d]# `yum --disablerepo="*" --enablerepo=epel install ncdu`  
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-manager  
  
This system is not registered with an entitlement server. You can use subscription-manager to register.  

Loading mirror speeds from cached hostfile  
 * epel: www.nic.funet.fi  
Resolving Dependencies  
--> Running transaction check  
---> Package ncdu.x86_64 0:1.16-1.el7 will be installed  
--> Finished Dependency Resolution  
  
Dependencies Resolved  
Installing:  
 ncdu                   |   x86_64                    |  1.16-1.el7                  |     epel                  |     53 k  

Transaction Summary  
Install  1 Package  
... 
Complete!  

# 2 - Work with files

### 1) Find all regular files below 100 bytes inside your home directory.

[dasha@localhost ~]$ `ls -la`  
total 356  
drwx------. 3 dasha dasha    213 Dec 25 19:08 .  
drwxr-xr-x. 6 root  root      59 Dec  6 15:32 ..  
-rw-------. 1 dasha dasha   6939 Dec 25 19:12 .bash_history  
-rw-r--r--. 1 dasha dasha     18 Nov 24 19:33 .bash_logout  
-rw-r--r--. 1 dasha dasha    193 Nov 24 19:33 .bash_profile  
-rw-r--r--. 1 dasha dasha    231 Nov 24 19:33 .bashrc  
-rw-r--r--. 1 dasha dasha  12288 Dec 11 23:33 .brows-find.awk.swp  
-rw-------. 1 dasha dasha     57 Dec 25 19:10 .lesshst  
drwxrw----. 3 dasha dasha     19 Dec  6 00:37 .pki  
-rw-rw-r--. 1 dasha dasha 323020 Apr  4  2020 sysstat-10.1.5-19.el7.x86_64.rpm  
-rw-------. 1 dasha dasha      0 Dec 13 02:33 .Xauthority  
-rw-rw-r--. 1 dasha dasha     56 Dec 13 02:30 .xinitrc  
[dasha@localhost ~]$ `find ~ -type f -size -100c`  
/home/dasha/.bash_logout  
/home/dasha/.lesshst  
/home/dasha/.xinitrc  
/home/dasha/.Xauthority   

### 2) Find an inode number and a hard links count for the root directory. The hard link count should be about 17. Why?

[root@localhost /]# `stat /`  
  File: ‘/’  
  Size: 239             Blocks: 0          IO Block: 4096   directory  
Device: fd00h/64768d    Inode: 64          Links: 18   
Access: (0555/dr-xr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)  
Context: system_u:object_r:root_t:s0  
Access: 2021-12-25 17:22:52.224000000 +0300  
Modify: 2021-12-06 13:16:15.774000000 +0300  
Change: 2021-12-06 13:16:15.774000000 +0300   
 Birth: -  
 
 > As we can see the inode number is 64, hard links count is 18. For the root dir both . and .. points to the root, all .. links of subdirs also points to the /, however bin, lib, lib64, sbin are all links to usr subdirs, for them .. points to another places. That's qhy we have only 18
 
 ### 3) Check what inode numbers have "/" and "/boot" directory. Why?  
 
 [root@localhost /]# `ls -ia`
      64 .            3 dev         82 lib64     4195292 opt        125 sbin   8414486 usr  
      64 ..     4194369 etc   12583333 media           1 proc   8414525 srv   12582977 var  
     120 bin    8414524 home        83 mnt       8409153 root         1 sys  
      64 boot       124 lib   12884484 no_read      7173 run    4194376 tmp  
 [root@localhost /]# `stat / | grep Inode`   
Device: fd00h/64768d    
Inode: 64          
Links: 18  
[root@localhost /]# `stat /boot | grep Inode`    
Device: 801h/2049d   
Inode: 64        
Links: 5   
> although these dirs have the same inode they are placed on different devices and flesystems. Inode numbers are only unique within a filesystem

### 4) Check the root directory space usage by du command. Compare it with an information from df. If you find differences, try to find out why it happens

[root@localhost /]# `du -hs /`  
du: cannot access ‘/proc/9345/task/9345/fd/4’: No such file or directory  
du: cannot access ‘/proc/9345/task/9345/fdinfo/4’: No such file or directory  
du: cannot access ‘/proc/9345/fd/3’: No such file or directory  
du: cannot access ‘/proc/9345/fdinfo/3’: No such file or directory  
2.7G    /  
[root@localhost /]# `df -h /`  
Filesystem               Size  Used Avail Use% Mounted on  
/dev/mapper/centos-root  6.2G  2.6G  3.7G  41% /  
 
> These numbers are different because df and du work differently in case of file deleting and disk space realese. The result of the command du doesn't include the size of the deleting file.
>  So if there are open descriptors in /proc/ to deleted files, space occupied by them considered as used by df

[root@localhost /]#  `lsof | grep '(deleted)'`
firewalld  675         root    8u      REG              253,0      4096    4194373 /tmp/#4194373 (deleted)  
gmain      675  797    root    8u      REG              253,0      4096    4194373 /tmp/#4194373 (deleted)  
tuned      969         root    8u      REG              253,0      4096    4194377 /tmp/#4194377 (deleted)  
gmain      969 1261    root    8u      REG              253,0      4096    4194377 /tmp/#4194377 (deleted)  
tuned      969 1263    root    8u      REG              253,0      4096    4194377 /tmp/#4194377 (deleted)  
tuned      969 1267    root    8u      REG              253,0      4096    4194377 /tmp/#4194377 (deleted)  
tuned      969 1273    root    8u      REG              253,0      4096    4194377 /tmp/#4194377 (deleted)  
nginx     1862         root  txt       REG              253,0   1377720    1643009 /usr/sbin/nginx (deleted)  
nginx     1863        nginx  txt       REG              253,0   1377720    1643009 /usr/sbin/nginx (deleted)  

### 5) Check disk space usage of /var/log directory using ncdu  
[root@localhost /]# `ncdu /var/log`    
--- /var/log -----------------------------------------------------------------------------------------------------------  
    2.3 MiB [#################] /audit 
    2.0 MiB [##############   ] /anaconda   
    1.3 MiB [#########        ]  messages-20211208  
  244.0 KiB [#                ]  messages-20211221  
  232.0 KiB [#                ]  messages-20211212  
  188.0 KiB [#                ]  messages  
  112.0 KiB [                 ]  boot.log-20211206  
   72.0 KiB [                 ]  secure-20211208  
   72.0 KiB [                 ]  wtmp  
   56.0 KiB [                 ]  boot.log-20211208  
   44.0 KiB [                 ] /tuned  
   32.0 KiB [                 ]  boot.log-20211221  
   32.0 KiB [                 ]  dmesg.old  
   32.0 KiB [                 ]  dmesg  
   24.0 KiB [                 ]  boot.log-20211225  
   24.0 KiB [                 ] /rhsm  
   20.0 KiB [                 ]  lastlog  
   20.0 KiB [                 ]  yum.log  
   12.0 KiB [                 ]  tallylog  
   12.0 KiB [                 ]  cron-20211208  
   12.0 KiB [                 ]  maillog-20211208  
   12.0 KiB [                 ]  secure-20211212  
    8.0 KiB [                 ]  boot.log-20211211  
    8.0 KiB [                 ]  boot.log-20211212  

