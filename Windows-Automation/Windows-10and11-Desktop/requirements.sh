# Notepad++
if [ ! -f /home/vvolf/Ansible/Windows-Automation/Windows-10and11-Desktop/roles/App_install/files/npp.8.7.9.Installer.x64.exe ]; then
  wget -P /home/vvolf/Ansible/Windows-Automation/Windows-10and11-Desktop/roles/App_install/files https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.7.9/npp.8.7.9.Installer.x64.exe
fi

# Zabbix-Agent
if [ ! -f /home/vvolf/Ansible/Windows-Automation/Windows-10and11-Desktop/roles/App_install/files/zabbix_agent-7.2.5-windows-amd64-openssl.zip ]; then
  wget -P /home/vvolf/Ansible/Windows-Automation/Windows-10and11-Desktop/roles/App_install/files https://cdn.zabbix.com/zabbix/binaries/stable/7.2/7.2.5/zabbix_agent-7.2.5-windows-amd64-openssl.zip
fi

# Wireshark
if [ ! -f /home/vvolf/Ansible/Windows-Automation/Windows-10and11-Desktop/roles/App_install/files/Wireshark-4.4.5-x64.exe ]; then
  wget -P /home/vvolf/Ansible/Windows-Automation/Windows-10and11-Desktop/roles/App_install/files https://2.na.dl.wireshark.org/win64/Wireshark-4.4.5-x64.exe
fi

# WinSCP
if [ ! -f /home/vvolf/Ansible/Windows-Automation/Windows-10and11-Desktop/roles/App_install/files/WinSCP-6.5-Portable.zip ]; then
  wget -P /home/vvolf/Ansible/Windows-Automation/Windows-10and11-Desktop/roles/App_install/files https://winscp.net/download/WinSCP-6.5-Portable.zip/download -O /home/vvolf/Ansible/Windows-Automation/Windows-10and11-Desktop/roles/App_install/files/WinSCP-6.5-Portable.zip
fi

# Google Chrome
if [ ! -f /home/vvolf/Ansible/Windows-Automation/Windows-10and11-Desktop/roles/App_install/files/chrome_installer.exe ]; then
  wget -P /home/vvolf/Ansible/Windows-Automation/Windows-10and11-Desktop/roles/App_install/files https://dl.google.com/chrome/install/latest/chrome_installer.exe
fi
