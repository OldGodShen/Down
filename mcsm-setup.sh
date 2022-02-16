#!/bin/bash
printf "\033c"

Other_Arch() {
  read -p "未知架构，默认选择为x64，请确认是否继续安装！(y/n):" choice;
  if [ "$choice" = 'y' ]; then
    arch="x64"
    elif [ "$choice" = 'n' ]; then
    Red_Error "已退出安装"
    else
    echo "未知选项"
    Other_Arch
  fi
}

Check_Arch() { 
  if [ "$(uname -m)" = 'x86_64' ]; then
    arch="x64"
    echo "系统架构为x64"
    elif [ "$(uname -m)" = 'i386' ]; then
    arch="x86"
    Red_Error "系统架构为x86，无法安装node-v14.17.6，请自行解决"
    elif [ "$(uname -m)" = 'i486' ]; then
    arch="x86"
    Red_Error "系统架构为x86，无法安装node-v14.17.6，请自行解决"
    elif [ "$(uname -m)" = 'i586' ]; then
    arch="x86"
    Red_Error "系统架构为x86，无法安装node-v14.17.6，请自行解决"
    elif [ "$(uname -m)" = 'i686' ]; then
    arch="x86"
    Red_Error "系统架构为x86，无法安装node-v14.17.6，请自行解决"
    elif [ "$(uname -m)" = 'aarch64' ]; then
    arch="arm64"
    echo "系统架构为arm64"
    elif [ "$(uname -m)" = 'ppc64le' ]; then
    arch="ppc64le"
    echo "系统架构为ppc64le"
    elif [ "$(uname -m)" = 's390x' ]; then
    arch="s390x"
    echo "系统架构为s390x"
    elif [ "$(uname -m)" = 'armv7l' ]; then
    arch="armv7l"
    echo "系统架构为armv7l"
    else
    Other_Arch
fi
}


Red_Error() {
  echo '================================================='
  printf '\033[1;31;40m%b\033[0m\n' "$@"
  echo '================================================='
  exit 1
}
 

Install_Node() {
  node_install_path="/opt/node-v14.17.6-linux-${arch}"
  echo "即将开始安装node-v14.17.6-linux-${arch}"
  sleep 3
  echo "[x] rm -irf ${node_install_path}"
  rm -irf ${node_install_path}

  echo "[→] cd /opt || exit"
  cd /opt || exit

  echo "[↓] wget https://npm.taobao.org/mirrors/node/v14.17.6/node-v14.17.6-linux-${arch}.tar.gz"
  wget https://npm.taobao.org/mirrors/node/v14.17.6/node-v14.17.6-linux-${arch}.tar.gz

  echo "[↑] tar -zxf node-v14.17.6-linux-${arch}.tar.gz"
  tar -zxf node-v14.17.6-linux-${arch}.tar.gz

  echo "[x] rm -rf node-v14.17.6-linux-${arch}.tar.gz"
  rm -rf node-v14.17.6-linux-${arch}.tar.gz

  echo "[x] Delete the original Node link"
  rm -f /usr/bin/npm
  rm -f /usr/bin/node
  rm -f /usr/local/bin/npm
  rm -f /usr/local/bin/node

  echo "[+] Creating a Node link"
  ln -s ${node_install_path}/bin/npm /usr/bin/
  ln -s ${node_install_path}/bin/node /usr/bin/
  ln -s ${node_install_path}/bin/npm /usr/local/bin/
  ln -s ${node_install_path}/bin/node /usr/local/bin/

  echo "=============== Node Version ==============="
  echo " node: $(node -v)"
  echo " npm: $(npm -v)"
  echo "=============== Node Version ==============="
  echo
  echo "[-] Node Installed Successfully!"
  echo

}

Install_MCSManager() {
  mcsmanager_install_path="/opt/mcsmanager"
  echo "即将开始安装MCSManager9"
  sleep 3

  echo "[x] Delete the original MCSManager"
  rm -irf ${mcsmanager_install_path}

  echo "[+] mkdir -p ${mcsmanager_install_path}"
  mkdir -p ${mcsmanager_install_path} || exit

  echo "[→] cd ${mcsmanager_install_path}"
  cd ${mcsmanager_install_path} || exit

  echo "[↓] git clone MCSManager/MCSManager-Daemon-Production.git"
  git clone https://gitee.com/mcsmanager/MCSManager-Daemon-Production.git

  echo "[-] mv MCSManager-Daemon-Production daemon"
  mv MCSManager-Daemon-Production daemon

  echo "[→] cd daemon"
  cd daemon || exit

  echo "[+] npm install --registry=https://registry.npm.taobao.org"
  npm install --registry=https://registry.npm.taobao.org

  echo "[←] cd .."
  cd ..

  echo "[↓] git clone mcsmanager/MCSManager-Web-Production.git"
  git clone https://gitee.com/mcsmanager/MCSManager-Web-Production.git

  echo "[-] mv MCSManager-Web-Production web"
  mv MCSManager-Web-Production web

  echo "[→] cd web"
  cd web || exit

  echo "[+] npm install --registry=https://registry.npm.taobao.org"
  npm install --registry=https://registry.npm.taobao.org

  echo "=============== MCSManager ==============="
  echo " Daemon: ${mcsmanager_install_path}/daemon"
  echo " Web: ${mcsmanager_install_path}/web"
  echo "=============== MCSManager ==============="
  echo
  echo ""
  echo -e "\033[1;32m[ok] MCSManager installed successfully!!!\033[0m"
  echo "[ok] Location: ${mcsmanager_install_path}"
  echo
}

Create_Service() {

  echo "[x] Initialize the service file"
  rm -f /etc/systemd/system/mcsm-daemon.service
  rm -f /etc/systemd/system/mcsm-web.service

  echo "[+] cat >>/etc/systemd/system/mcsm-daemon.service"
  cat >>/etc/systemd/system/mcsm-daemon.service <<'EOF'
[Unit]
Description=MCSManager Daemon

[Service]
WorkingDirectory=/opt/mcsmanager/daemon
ExecStart=/usr/bin/node app.js
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s QUIT $MAINPID

[Install]
WantedBy=multi-user.target
EOF

  echo "[+] cat >>/etc/systemd/system/mcsm-web.service"
  cat >>/etc/systemd/system/mcsm-web.service <<'EOF'
[Unit]
Description=MCSManager Web

[Service]
WorkingDirectory=/opt/mcsmanager/web
ExecStart=/usr/bin/node app.js
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s QUIT $MAINPID

[Install]
WantedBy=multi-user.target
EOF

  echo "[-] systemctl daemon-reload"
  systemctl daemon-reload

  echo "[+] systemctl enable mcsm-daemon.service --now"
  systemctl enable mcsm-daemon.service --now


  echo "[+] systemctl enable mcsm-web.service --now"
  systemctl enable mcsm-web.service --now


  echo "=================================================================="
  echo -e "\033[1;32mWelcome to MCSManager\033[0m"
  echo "=================================================================="
  echo "Web Service Address:    http://localhost:23333"
  echo "Daemon Service Address: http://localhost:24444"
  echo "Username: root"
  echo "Password: 123456"
  echo -e "\033[33mEnglish: You must expose ports 23333 and 24444 to use the service properly on the Internet.\033[0m"
  echo -e "\033[33mChinese: 安装且启动完毕，您必须开放 23333 与 24444 端口来确保面板的正常使用。\033[0m"
  echo ""
  echo "=================================================================="
  echo "systemctl restart mcsm-{daemon,web}.service"
  echo "systemctl disable mcsm-{daemon,web}.service"
  echo "systemctl enable mcsm-{daemon,web}.service"
  echo "systemctl start mcsm-{daemon,web}.service"
  echo "systemctl stop mcsm-{daemon,web}.service"
  echo "=================================================================="

}

# ----------------- Program start ----------------- 

if [ $(whoami) != "root" ]; then
  Red_Error "[x] 请使用Root账户安装，通常在命令前加入'sudo '即可使用Root权限运行程序"
fi


echo "+----------------------------------------------------------------------
| MCSManager Installer
+----------------------------------------------------------------------
| Copyright © 2021 Suwings All rights reserved.
+----------------------------------------------------------------------
| Shell Install Script by Nuomiaa , OldGodShen
+----------------------------------------------------------------------
"

echo "[+] 安装git和tar"
yum install -y git tar wget ca-certificates
apt install -y git tar wget ca-certificates
apk add -q git tar wget ca-certificates
pacman -Syu --noconfirm git tar wget ca-certificates

Check_Arch
Install_Node
Install_MCSManager
Create_Service