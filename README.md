# systemd ��ϵͳbug,����ϵͳ�˳��ն˺�����쳣kill,д�����������Խ��������Ϊ����
java������centos7���濪��������
1.�����������򵥵�start,status,stop����
/data/app/jarservice.sh
2.��д�������ļ�
 /lib/systemd/system/jar.service
3.��������
systemctl daemon-reload
systemctl start jar.service
systemctl status jar.service
#redis zk tomcat kafka