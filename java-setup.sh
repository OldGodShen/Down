#!/bin/bash
printf "\033c"
echo "本程序将会自动安装Java8,Java11,Java17"
echo "安装完成后，可以通过java8,java11,java17进行调用"

Check_Arch(){
  if [ "$(uname -m)" = 'x86_64' ]; then
    arch="x64"
    echo "系统架构为x64，将会安装x64的JDK"
  elif [ "$(uname -m)" = 'i386' ]; then
    arch="x86"
    echo "系统架构为x86，将会安装x86的JDK"
  elif [ "$(uname -m)" = 'i486' ]; then
    arch="x86"
    echo "系统架构为x86，将会安装x86的JDK"
  elif [ "$(uname -m)" = 'i586' ]; then
    arch="x86"
    echo "系统架构为x86，将会安装x86的JDK"
  elif [ "$(uname -m)" = 'i686' ]; then
    arch="x86"
    echo "系统架构为x86，将会安装x86的JDK"
  elif [ "$(uname -m)" = 'aarch64' ]; then
    arch="arm64"
    echo "系统架构为arm64，将会安装arm64的JDK"
  else
    Red_Error "架构尚未支持支持，已停止安装！"
  fi
}


Red_Error() {
  echo '================================================='
  printf '\033[1;31;40m%b\033[0m\n' "$@"
  echo '================================================='
  exit 1
}
 

Choose_JDK() {
  Check_Arch
  echo "本安装脚本支持一键安装ZuluJDK,OpenJDK,AdoptOpenJDK,LibericaJDK,MicrosoftJDK,IBMJDK(目前只写了Zulu的)"
  read -p "输入要安装的JDK发行版(zulu,openjdk,adopt,liberica,microsoft,ibm): " jdk;
  if [ "$jdk" = 'zulu' ]; then
    echo "选择的JDK版本为$jdk"
    Zulu_$arch
    elif [ "$jdk" = 'openjdk' ]; then
    echo "选择的JDK版本为$jdk"
    #OpenJDK_$arch
    elif [ "$jdk" = 'adopt' ]; then
    echo "选择的JDK版本为$jdk"
    #Adopt_$arch
    elif [ "$jdk" = 'liberica' ]; then
    echo "选择的JDK版本为$jdk"
    #Liberica_$arch
    elif [ "$jdk" = 'microsoft' ]; then
    echo "选择的JDK版本为$jdk"
    #Microsoft_$arch
    elif [ "$jdk" = 'ibm' ]; then
    echo "选择的JDK版本为$jdk"
    #IBM_$arch
    else
    echo "未知版本，请重新选择"
    Choose_JDK
  fi
  Red_Error "还没写$jdk发行版的安装程序..."
}
  
Zulu_x64() {
  java_install_path="/opt/$jdk"
  echo "[→] mkdir /opt/zulu"
  mkdir /opt/zulu

  echo "[→] cd /opt/zulu || exit"
  cd /opt/zulu || exit

  echo "开始安装ZuluJDK8"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz

  echo "[↑] tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz"
  tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz

  echo "[x] rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz"
  rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz

  echo "[+] Creating a ZuluJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_x64/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_x64/bin/java /usr/local/bin/java8
  echo
  echo "[-] ZuluJDK8 Installed Successfully!"
  echo

  echo "开始安装ZuluJDK11"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz

  echo "[↑] tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz"
  tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz

  echo "[x] rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz"
  rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz

  echo "[+] Creating a ZuluJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_x64/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_x64/bin/java /usr/local/bin/java11
  echo
  echo "[-] ZuluJDK11 Installed Successfully!"
  echo

  echo "开始安装ZuluJDK17"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz

  echo "[↑] tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz"
  tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz

  echo "[x] rm -rf zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz"
  rm -rf zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz

  echo "[+] Creating a ZuluJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_x64/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_x64/bin/java /usr/local/bin/java17
  echo
  echo "[-] ZuluJDK17 Installed Successfully!"
  echo

  echo "[-] ZuluJDK Installed completely!"

  Finish
}

Zulu_x86() {
  java_install_path="/opt/$jdk"
  echo "[→] mkdir /opt/zulu"
  mkdir /opt/zulu

  echo "[→] cd /opt/zulu || exit"
  cd /opt/zulu || exit

  echo "开始安装ZuluJDK8"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz

  echo "[↑] tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz"
  tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz

  echo "[x] rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz"
  rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz

  echo "[+] Creating a ZuluJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_i686/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_i686/bin/java /usr/local/bin/java8
  echo
  echo "[-] ZuluJDK8 Installed Successfully!"
  echo

  echo "开始安装ZuluJDK11"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz

  echo "[↑] tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz"
  tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz

  echo "[x] rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz"
  rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz

  echo "[+] Creating a ZuluJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_i686/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_i686/bin/java /usr/local/bin/java11
  echo
  echo "[-] ZuluJDK11 Installed Successfully!"
  echo

  echo "开始安装ZuluJDK17"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz

  echo "[↑] tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz"
  tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz

  echo "[x] rm -rf zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz"
  rm -rf zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz

  echo "[+] Creating a ZuluJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_i686/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_i686/bin/java /usr/local/bin/java17
  echo
  echo "[-] ZuluJDK17 Installed Successfully!"
  echo

  echo "[-] ZuluJDK Installed completely!"

  Finish
}

Zulu_arm64() {
  java_install_path="/opt/$jdk"
  echo "[→] mkdir /opt/zulu"
  mkdir /opt/zulu

  echo "[→] cd /opt/zulu || exit"
  cd /opt/zulu || exit

  echo "开始安装ZuluJDK8"

  echo "[↓] wget https://cdn.azul.com/zulu-embedded/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gz"
  wget https://cdn.azul.com/zulu-embedded/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gz

  echo "[↑] tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gzz"
  tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gz

  echo "[x] rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gz"
  rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gz

  echo "[+] Creating a ZuluJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64/bin/java /usr/local/bin/java8
  echo
  echo "[-] ZuluJDK8 Installed Successfully!"
  echo

  echo "开始安装ZuluJDK11"

  echo "[↓] wget https://cdn.azul.com/zulu-embedded/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz"
  wget https://cdn.azul.com/zulu-embedded/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz

  echo "[↑] tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz"
  tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz

  echo "[x] rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz"
  rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz

  echo "[+] Creating a ZuluJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64/bin/java /usr/local/bin/java11
  echo
  echo "[-] ZuluJDK11 Installed Successfully!"
  echo

  echo "开始安装ZuluJDK17"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz

  echo "[↑] tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz"
  tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz

  echo "[x] rm -rf zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz"
  rm -rf zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz

  echo "[+] Creating a ZuluJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_aarch64/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_aarch64/bin/java /usr/local/bin/java17
  echo
  echo "[-] ZuluJDK17 Installed Successfully!"
  echo

  echo "[-] ZuluJDK Installed completely!"

  Finish
}

Finish() {
  echo "已安装完成，可以通过java8,java11,java17进行调用"
  exit 1
}
# ----------------- Program start ----------------- 

if [ $(whoami) != "root" ]; then
  Red_Error "[x] 请使用Root账户安装，通常在命令前加入'sudo '即可使用Root权限运行程序"
fi


echo "+----------------------------------------------------------------------
| Java Install
+----------------------------------------------------------------------
| Shell Install Script by OldGodShen
+----------------------------------------------------------------------
"

echo "[+] 安装tar,ca-certificates,wget"
yum install -y tar wget ca-certificates
apt install -y tar wget ca-certificates
apk add -q tar wget ca-certificates
pacman -Syu --noconfirm tar wget ca-certificates

Choose_JDK