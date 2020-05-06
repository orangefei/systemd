```python
init程序的类型：
SysV: init, CentOS 5之前, 配置文件： /etc/inittab。 
Upstart: init,CentOS 6, 配置文件： /etc/inittab, /etc/init/*.conf。 
Systemd： systemd, CentOS 7,配置文件： /usr/lib/systemd/system、 /etc/systemd/system

systemd 
因（云服务）系统bug,导致系统退出终端后服务被异常kill,写入自启动可以解决。以下为汇总
java程序在centos7里面开机自启动 
1.我们先来个简单的start,status,stop程序 /data/app/jarservice.sh 
2.再写个服务文件 /lib/systemd/system/jar.service 
3.启动服务
systemctl daemon-reload
systemctl start jar.service 
systemctl status jar.service 
#redis zk tomcat kafka#
```

