## Install Grafana
#=====#=======#====
/usr/bin/apt-get install -y adduser libfontconfig1	;
/usr/bin/wget https://dl.grafana.com/enterprise/release/grafana-enterprise_10.0.2_amd64.deb ;
/usr/bin/dpkg -i grafana-enterprise_10.0.2_amd64.deb	;

# Create Folder and  change permission
#============#=================#========
mkdir /var/log/network-logs	;
mkdir /var/log/network-logs/logs-archive	;
chown syslog:adm /var/log/network-logs	;
chown syslog:adm /var/log/network-logs/logs-archive	;

# Copy folder & files
#=========#=======#====
cp -r /opt/mikrotik-log-main/etc/* /etc/	;

# Download loki & promtail
#==========#==========#=====
wget https://github.com/grafana/loki/releases/download/v2.8.2/loki-linux-amd64.zip	;
wget https://github.com/grafana/loki/releases/download/v2.8.2/promtail-linux-amd64.zip	;

# Extract & move files
#=======#======#=====
unzip loki-linux-amd64.zip  ;
unzip promtail-linux-amd64.zip  ;
mv /opt/loki-linux-amd64 /etc/loki/loki	;
mv /opt/promtail-linux-amd64 /etc/promtail/promtail	;

# Load the new service file
#===========#==========#=====
/bin/systemctl daemon-reload	;

# Start services at boot
#====#===========#========
/bin/systemctl enable rsyslog loki promtail grafana-server	;

# Restart service
#=======#========#==
/bin/systemctl restart rsyslog loki promtail grafana-server	;

# Show service status
#=======#========#==
/bin/systemctl status rsyslog loki promtail grafana-server	;