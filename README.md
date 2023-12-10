# otus_nfs
Запускаем Vagrant файл, который конфигурирует две виртуальные машины:
cервер nfs и клиент nfs.<br>
Автоматически с помощью скриптов для сервера и клиента устанавливается и настраивается nfs
В скрипте nfss_script.sh: <br>
- устанавливаются специальные утилиты для работы nfs  <br>
- запускается firewalld и ставиться в автозагрузку  <br>
- настраивается firewalld для работы с nfs  <br>
- создается сетевая папка и выдаются определенные разрешения на нее  <br>
- в файле /etc/exports создается структура для экспортирования ранее созданной папки и далее данная папка экспортируется  <br>
- создается файл в созданной папке для дальнейшей проверки<br><br>

В скрипте nfsc_script.sh: <br>
- устанавливаются специальные утилиты для работы nfs  <br>
- добавляются параметры для автозагрузки директории nfs в /etc/fstab  <br>
- запускается firewall  <br>
- создается файл для проверки работы nfs  <br>  <br>

Проверяем успешность монтирования nfs на клиенте
<pre>[root@nfsc vagrant]# mount | grep mnt
systemd-1 on /mnt type autofs (rw,relatime,fd=51,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=28473)
192.168.56.10:/srv/share/ on /mnt type nfs (rw,relatime,vers=3,rsize=32768,wsize=32768,namlen=255,hard,proto=udp,timeo=11,retrans=3,sec=sys,mountaddr=192.168.56.10,mountvers=3,mountport=20048,mountproto=udp,local_lock=none,addr=192.168.56.10)
</pre>
Проверяем каталог монтирования и видим созданные скриптами файлы 
<pre>[root@nfsc vagrant]# ls -la /mnt/upload/
total 0
drwxrwxrwx. 2 nfsnobody nfsnobody 43 Dec 10 08:36 .
drwxr-xr-x. 3 nfsnobody nfsnobody 20 Dec 10 08:33 ..
-rw-r--r--. 1 root      root       0 Dec 10 08:33 check_file
-rw-r--r--. 1 nfsnobody nfsnobody  0 Dec 10 08:36 client_file
</pre>


