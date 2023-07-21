# Mikrotik Configuration :-
```bash
/system logging action add bsd-syslog=yes name=SysLog remote=195.168.1.10 syslog-facility=local6 target=remote
/system logging add action=SysLog topics=system
```

# Installation
```bash
apt install -y unzip ;
cd /opt/
wget https://github.com/riponmollick66/mikrotik-log/archive/refs/heads/main.zip
unzip main.zip
chmod +x /opt/mikrotik-log-main/install.sh
/opt/mikrotik-log-main/install.sh
```
