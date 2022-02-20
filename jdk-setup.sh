#!/bin/bash

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
  echo "本安装脚本支持一键安装ZuluOpenJDK,OracleOpenJDK,AdoptOpenJDK,LibericaOpenJDK,MicrosoftOpenJDK,SemeruOpenJDK,DragonwellOpenJDK"
  read -p "输入要安装的JDK发行版(zulu,oracle,adopt,liberica,microsoft,semeru,dragonwell): " jdk;
  if [ "$jdk" = 'zulu' ]; then
    Install_JDK
    elif [ "$jdk" = 'oracle' ]; then
    Install_JDK
    elif [ "$jdk" = 'adopt' ]; then
    Install_JDK
    elif [ "$jdk" = 'liberica' ]; then
    Install_JDK
    elif [ "$jdk" = 'microsoft' ]; then
    Install_JDK
    elif [ "$jdk" = 'semeru' ]; then
    Install_JDK
    elif [ "$jdk" = 'dragonwell' ]; then
    Install_JDK
    else
    echo "未知版本，请重新选择"
    Choose_JDK
  fi
}

Install_JDK() {
    echo "选择的JDK版本为$jdk"
    java_install_path="/opt/$jdk"
    echo "mkdir $java_install_path"
    mkdir $java_install_path
    echo "[→] cd $java_install_path || exit"
    cd $java_install_path || exit
    $jdk\_$arch
}

zulu_x64() {
  echo "开始安装ZuluOpenJDK8"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz

  echo "[↑] tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz"
  tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz

  echo "[x] rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz"
  rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_x64.tar.gz

  echo "[+] Creating a ZuluOpenJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_x64/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_x64/bin/java /usr/local/bin/java8
  echo
  echo "[-] ZuluOpenJDK8 Installed Successfully!"
  echo

  echo "开始安装ZuluOpenJDK11"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz

  echo "[↑] tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz"
  tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz

  echo "[x] rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz"
  rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_x64.tar.gz

  echo "[+] Creating a ZuluOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_x64/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_x64/bin/java /usr/local/bin/java11
  echo
  echo "[-] ZuluOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装ZuluOpenJDK17"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz

  echo "[↑] tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz"
  tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz

  echo "[x] rm -rf zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz"
  rm -rf zulu17.32.13-ca-jdk17.0.2-linux_x64.tar.gz

  echo "[+] Creating a ZuluOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_x64/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_x64/bin/java /usr/local/bin/java17
  echo
  echo "[-] ZuluOpenJDK17 Installed Successfully!"
  echo

  echo "[-] ZuluOpenJDK Installed completely!"

  Finish
}

zulu_x86() {
  echo "开始安装ZuluOpenJDK8"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz

  echo "[↑] tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz"
  tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz

  echo "[x] rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz"
  rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_i686.tar.gz

  echo "[+] Creating a ZuluOpenJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_i686/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_i686/bin/java /usr/local/bin/java8
  echo
  echo "[-] ZuluOpenJDK8 Installed Successfully!"
  echo

  echo "开始安装ZuluOpenJDK11"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz

  echo "[↑] tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz"
  tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz

  echo "[x] rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz"
  rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_i686.tar.gz

  echo "[+] Creating a ZuluOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_i686/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_i686/bin/java /usr/local/bin/java11
  echo
  echo "[-] ZuluOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装ZuluOpenJDK17"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz

  echo "[↑] tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz"
  tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz

  echo "[x] rm -rf zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz"
  rm -rf zulu17.32.13-ca-jdk17.0.2-linux_i686.tar.gz

  echo "[+] Creating a ZuluOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_i686/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_i686/bin/java /usr/local/bin/java17
  echo
  echo "[-] ZuluOpenJDK17 Installed Successfully!"
  echo

  echo "[-] ZuluOpenJDK Installed completely!"

  Finish
}

zulu_arm64() {
  echo "开始安装ZuluOpenJDK8"

  echo "[↓] wget https://cdn.azul.com/zulu-embedded/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gz"
  wget https://cdn.azul.com/zulu-embedded/bin/zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gz

  echo "[↑] tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gz"
  tar -zxf zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gz

  echo "[x] rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gz"
  rm -rf zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64.tar.gz

  echo "[+] Creating a ZuluOpenJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/zulu8.60.0.21-ca-jdk8.0.322-linux_aarch64/bin/java /usr/local/bin/java8
  echo
  echo "[-] ZuluOpenJDK8 Installed Successfully!"
  echo

  echo "开始安装ZuluOpenJDK11"

  echo "[↓] wget https://cdn.azul.com/zulu-embedded/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz"
  wget https://cdn.azul.com/zulu-embedded/bin/zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz

  echo "[↑] tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz"
  tar -zxf zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz

  echo "[x] rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz"
  rm -rf zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64.tar.gz

  echo "[+] Creating a ZuluOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/zulu11.54.25-ca-jdk11.0.14.1-linux_aarch64/bin/java /usr/local/bin/java11
  echo
  echo "[-] ZuluOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装ZuluOpenJDK17"

  echo "[↓] wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz"
  wget https://cdn.azul.com/zulu/bin/zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz

  echo "[↑] tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz"
  tar -zxf zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz

  echo "[x] rm -rf zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz"
  rm -rf zulu17.32.13-ca-jdk17.0.2-linux_aarch64.tar.gz

  echo "[+] Creating a ZuluOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_aarch64/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/zulu17.32.13-ca-jdk17.0.2-linux_aarch64/bin/java /usr/local/bin/java17
  echo
  echo "[-] ZuluOpenJDK17 Installed Successfully!"
  echo

  echo "[-] ZuluOpenJDK Installed completely!"

  Finish
}

oracle_x64() {
  echo "由于Oracle限制，本脚本仅能安装OracleOpenJDK17"
  echo "开始安装OracleOpenJDK17"

  echo "[↓] wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz"
  wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz

  echo "[↑] tar -zxf jdk-17_linux-x64_bin.tar.gz"
  tar -zxf jdk-17_linux-x64_bin.tar.gz

  echo "[x] rm -rf jdk-17_linux-x64_bin.tar.gz"
  rm -rf jdk-17_linux-x64_bin.tar.gz

  echo "[+] Creating a OracleOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/jdk-17_linux-x64_bin/jdk-17.0.2/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/jdk-17_linux-x64_bin/jdk-17.0.2/bin/java /usr/local/bin/java17
  echo
  echo "[-] OracleOpenJDK17 Installed Successfully!"
  echo

  Finish
}

oracle_x86() {
  echo "由于Oracle并没有提供x86的包，所以请使用其他发行版"
  Choose_JDK
}

oracle_arm64() {
  echo "由于Oracle限制，本脚本仅能安装OracleOpenJDK17"
  echo "开始安装OracleOpenJDK17"

  echo "[↓] wget https://download.oracle.com/java/17/latest/jdk-17_linux-aarch64_bin.tar.gz"
  wget https://download.oracle.com/java/17/latest/jdk-17_linux-aarch64_bin.tar.gz

  echo "[↑] tar -zxf jdk-17_linux-aarch64_bin.tar.gz"
  tar -zxf jdk-17_linux-aarch64_bin.tar.gz

  echo "[x] rm -rf jdk-17_linux-aarch64_bin.tar.gz"
  rm -rf jdk-17_linux-aarch64_bin.tar.gz

  echo "[+] Creating a OracleOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/jdk-17_linux-aarch64_bin/jdk-17.0.2/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/jdk-17_linux-aarch64_bin/jdk-17.0.2/bin/java /usr/local/bin/java17
  echo
  echo "[-] OracleOpenJDK17 Installed Successfully!"
  echo

  Finish
}

adopt_x64() {
  echo "开始安装AdoptOpenJDK8"

  echo "[↓] wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/8/jdk/x64/linux/OpenJDK8U-jdk_x64_linux_hotspot_8u322b06.tar.gz"
  wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/8/jdk/x64/linux/OpenJDK8U-jdk_x64_linux_hotspot_8u322b06.tar.gz

  echo "[↑] tar -zxf OpenJDK8U-jdk_x64_linux_hotspot_8u322b06.tar.gz"
  tar -zxf OpenJDK8U-jdk_x64_linux_hotspot_8u322b06.tar.gz

  echo "[x] rm -rf OpenJDK8U-jdk_x64_linux_hotspot_8u322b06.tar.gz"
  rm -rf OpenJDK8U-jdk_x64_linux_hotspot_8u322b06.tar.gz

  echo "[+] Creating a AdoptOpenJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/OpenJDK8U-jdk_x64_linux_hotspot_8u322b06/jdk8u322-b06/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/OpenJDK8U-jdk_x64_linux_hotspot_8u322b06/jdk8u322-b06/bin/java /usr/local/bin/java8
  echo
  echo "[-] AdoptOpenJDK8 Installed Successfully!"
  echo

  echo "开始安装AdoptOpenJDK11"

  echo "[↓] wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/11/jdk/x64/linux/OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz"
  wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/11/jdk/x64/linux/OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz

  echo "[↑] tar -zxf OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz"
  tar -zxf OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz

  echo "[x] rm -rf OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz"
  rm -rf OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz

  echo "[+] Creating a AdoptOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1/jdk-11.0.14.1+1/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1/jdk-11.0.14.1+1/bin/java /usr/local/bin/java11
  echo
  echo "[-] AdoptOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装AdoptOpenJDK17"

  echo "[↓] wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/17/jdk/x64/linux/OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz"
  wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/17/jdk/x64/linux/OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz

  echo "[↑] tar -zxf OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz"
  tar -zxf OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz

  echo "[x] rm -rf OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz"
  rm -rf OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz

  echo "[+] Creating a AdoptOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8/jdk-17.0.2+8/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8/jdk-17.0.2+8/bin/java /usr/local/bin/java17
  echo
  echo "[-] AdoptOpenJDK17 Installed Successfully!"
  echo

  echo "[-] AdoptOpenJDK Installed completely!"

  Finish
}

adopt_x86() {
  echo "由于Adopt并没有提供x86的包，所以请使用其他发行版"
  Choose_JDK
}

adopt_arm64() {
  echo "开始安装AdoptOpenJDK8"

  echo "[↓] wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/8/jdk/aarch64/linux/OpenJDK8U-jdk_aarch64_linux_hotspot_8u322b06.tar.gz"
  wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/8/jdk/aarch64/linux/OpenJDK8U-jdk_aarch64_linux_hotspot_8u322b06.tar.gz

  echo "[↑] tar -zxf OpenJDK8U-jdk_aarch64_linux_hotspot_8u322b06.tar.gz"
  tar -zxf OpenJDK8U-jdk_aarch64_linux_hotspot_8u322b06.tar.gz

  echo "[x] rm -rf OpenJDK8U-jdk_aarch64_linux_hotspot_8u322b06.tar.gz"
  rm -rf OpenJDK8U-jdk_aarch64_linux_hotspot_8u322b06.tar.gz

  echo "[+] Creating a AdoptOpenJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/OpenJDK8U-jdk_aarch64_linux_hotspot_8u322b06/jdk8u322-b06/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/OpenJDK8U-jdk_aarch64_linux_hotspot_8u322b06/jdk8u322-b06/bin/java /usr/local/bin/java8
  echo
  echo "[-] AdoptOpenJDK8 Installed Successfully!"
  echo

  echo "开始安装AdoptOpenJDK11"

  echo "[↓] wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/11/jdk/aarch64/linux/OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1.tar.gz"
  wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/11/jdk/aarch64/linux/OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1.tar.gz

  echo "[↑] tar -zxf OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1.tar.gz"
  tar -zxf OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1.tar.gz

  echo "[x] rm -rf OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1.tar.gz"
  rm -rf OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1.tar.gz

  echo "[+] Creating a AdoptOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1/jdk-11.0.14.1+1/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1/jdk-11.0.14.1+1/bin/java /usr/local/bin/java11
  echo
  echo "[-] AdoptOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装AdoptOpenJDK17"

  echo "[↓] wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/17/jdk/aarch64/linux/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8.tar.gz"
  wget https://mirror.tuna.tsinghua.edu.cn/AdoptOpenJDK/17/jdk/aarch64/linux/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8.tar.gz

  echo "[↑] tar -zxf OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8.tar.gz"
  tar -zxf OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8.tar.gz

  echo "[x] rm -rf OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8.tar.gz"
  rm -rf OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8.tar.gz

  echo "[+] Creating a AdoptOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8/jdk-17.0.2+8/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8/jdk-17.0.2+8/bin/java /usr/local/bin/java17
  echo
  echo "[-] AdoptOpenJDK17 Installed Successfully!"
  echo

  echo "[-] AdoptOpenJDK Installed completely!"

  Finish
}

liberica_x64() {
  echo "开始安装LibericaOpenJDK8"

  echo "[↓] wget https://download.bell-sw.com/java/8u322+6/bellsoft-jdk8u322+6-linux-amd64-full.tar.gz"
  wget https://download.bell-sw.com/java/8u322+6/bellsoft-jdk8u322+6-linux-amd64-full.tar.gz

  echo "[↑] tar -zxf bellsoft-jdk8u322+6-linux-amd64-full.tar.gz"
  tar -zxf bellsoft-jdk8u322+6-linux-amd64-full.tar.gz

  echo "[x] rm -rf bellsoft-jdk8u322+6-linux-amd64-full.tar.gz"
  rm -rf bellsoft-jdk8u322+6-linux-amd64-full.tar.gz

  echo "[+] Creating a LibericaOpenJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/bellsoft-jdk8u322+6-linux-amd64-full/jdk8u322-full/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/bellsoft-jdk8u322+6-linux-amd64-full/jdk8u322-full/bin/java /usr/local/bin/java8
  echo
  echo "[-] LibericaOpenJDK8 Installed Successfully!"
  echo

  echo "开始安装LibericaOpenJDK11"

  echo "[↓] wget https://download.bell-sw.com/java/11.0.14.1+1/bellsoft-jdk11.0.14.1+1-linux-amd64-full.tar.gz"
  wget https://download.bell-sw.com/java/11.0.14.1+1/bellsoft-jdk11.0.14.1+1-linux-amd64-full.tar.gz

  echo "[↑] tar -zxf bellsoft-jdk11.0.14.1+1-linux-amd64-full.tar.gz"
  tar -zxf bellsoft-jdk11.0.14.1+1-linux-amd64-full.tar.gz

  echo "[x] rm -rf bellsoft-jdk11.0.14.1+1-linux-amd64-full.tar.gz"
  rm -rf bellsoft-jdk11.0.14.1+1-linux-amd64-full.tar.gz

  echo "[+] Creating a LibericaOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/bellsoft-jdk11.0.14.1+1-linux-amd64-full/jdk-11.0.14.1-full/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/bellsoft-jdk11.0.14.1+1-linux-amd64-full/jdk-11.0.14.1-full/bin/java /usr/local/bin/java11
  echo
  echo "[-] LibericaOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装LibericaOpenJDK17"

  echo "[↓] wget https://download.bell-sw.com/java/17.0.2+9/bellsoft-jdk17.0.2+9-linux-amd64-full.tar.gz"
  wget https://download.bell-sw.com/java/17.0.2+9/bellsoft-jdk17.0.2+9-linux-amd64-full.tar.gz

  echo "[↑] tar -zxf bellsoft-jdk17.0.2+9-linux-amd64-full.tar.gz"
  tar -zxf bellsoft-jdk17.0.2+9-linux-amd64-full.tar.gz

  echo "[x] rm -rf bellsoft-jdk17.0.2+9-linux-amd64-full.tar.gz"
  rm -rf bellsoft-jdk17.0.2+9-linux-amd64-full.tar.gz

  echo "[+] Creating a LibericaOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/bellsoft-jdk17.0.2+9-linux-amd64-full/jdk-17.0.2-full/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/bellsoft-jdk17.0.2+9-linux-amd64-full/jdk-17.0.2-full/bin/java /usr/local/bin/java17
  echo
  echo "[-] LibericaOpenJDK17 Installed Successfully!"
  echo

  echo "[-] LibericaOpenJDK Installed completely!"

  Finish
}

liberica_x86() {
  echo "由于Liberica并没有提供x86的包，所以请使用其他发行版"
  Choose_JDK
}

liberica_arm64() {
  echo "开始安装LibericaOpenJDK8"

  echo "[↓] wget https://download.bell-sw.com/java/8u322+6/bellsoft-jdk8u322+6-linux-aarch64.tar.gz"
  wget https://download.bell-sw.com/java/8u322+6/bellsoft-jdk8u322+6-linux-aarch64.tar.gz

  echo "[↑] tar -zxf bellsoft-jdk8u322+6-linux-aarch64.tar.gz"
  tar -zxf bellsoft-jdk8u322+6-linux-aarch64.tar.gz

  echo "[x] rm -rf bellsoft-jdk8u322+6-linux-aarch64.tar.gz"
  rm -rf bellsoft-jdk8u322+6-linux-aarch64.tar.gz

  echo "[+] Creating a LibericaOpenJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/bellsoft-jdk8u322+6-linux-aarch64/jdk8u322/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/bellsoft-jdk8u322+6-linux-aarch64/jdk8u322/bin/java /usr/local/bin/java8
  echo
  echo "[-] LibericaOpenJDK8 Installed Successfully!"
  echo

  echo "开始安装LibericaOpenJDK11"

  echo "[↓] wget https://download.bell-sw.com/java/11.0.14.1+1/bellsoft-jdk11.0.14.1+1-linux-aarch64-full.tar.gz"
  wget https://download.bell-sw.com/java/11.0.14.1+1/bellsoft-jdk11.0.14.1+1-linux-aarch64-full.tar.gz

  echo "[↑] tar -zxf bellsoft-jdk11.0.14.1+1-linux-aarch64-full.tar.gz"
  tar -zxf bellsoft-jdk11.0.14.1+1-linux-aarch64-full.tar.gz

  echo "[x] rm -rf bellsoft-jdk11.0.14.1+1-linux-aarch64-full.tar.gz"
  rm -rf bellsoft-jdk11.0.14.1+1-linux-aarch64-full.tar.gz

  echo "[+] Creating a LibericaOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/bellsoft-jdk11.0.14.1+1-linux-aarch64-full/jdk-11.0.14.1-full/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/bellsoft-jdk11.0.14.1+1-linux-aarch64-full/jdk-11.0.14.1-full/bin/java /usr/local/bin/java11
  echo
  echo "[-] LibericaOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装LibericaOpenJDK17"

  echo "[↓] wget https://download.bell-sw.com/java/17.0.2+9/bellsoft-jdk17.0.2+9-linux-aarch64-full.tar.gz"
  wget https://download.bell-sw.com/java/17.0.2+9/bellsoft-jdk17.0.2+9-linux-aarch64-full.tar.gz

  echo "[↑] tar -zxf bellsoft-jdk17.0.2+9-linux-aarch64-full.tar.gz"
  tar -zxf bellsoft-jdk17.0.2+9-linux-aarch64-full.tar.gz

  echo "[x] rm -rf bellsoft-jdk17.0.2+9-linux-aarch64-full.tar.gz"
  rm -rf bellsoft-jdk17.0.2+9-linux-aarch64-full.tar.gz

  echo "[+] Creating a LibericaOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/bellsoft-jdk17.0.2+9-linux-aarch64-full/jdk-17.0.2.9-full/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/bellsoft-jdk17.0.2+9-linux-aarch64-full/jdk-17.0.2.9-full/bin/java /usr/local/bin/java17
  echo
  echo "[-] LibericaOpenJDK17 Installed Successfully!"
  echo

  echo "[-] LibericaOpenJDK Installed completely!"

  Finish
}

microsoft_x64() {
  echo "由于Microsoft并没有8，所以将会安装11和17"
  echo "开始安装MicrosoftOpenJDK11"

  echo "[↓] wget https://aka.ms/download-jdk/microsoft-jdk-11.0.14.9.1-linux-x64.tar.gz"
  wget https://aka.ms/download-jdk/microsoft-jdk-11.0.14.9.1-linux-x64.tar.gz

  echo "[↑] tar -zxf microsoft-jdk-11.0.14.9.1-linux-x64.tar.gz"
  tar -zxf microsoft-jdk-11.0.14.9.1-linux-x64.tar.gz

  echo "[x] rm -rf microsoft-jdk-11.0.14.9.1-linux-x64.tar.gz"
  rm -rf microsoft-jdk-11.0.14.9.1-linux-x64.tar.gz

  echo "[+] Creating a MicrosoftOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/microsoft-jdk-11.0.14.9.1-linux-x64/jdk-11.0.14+9/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/microsoft-jdk-11.0.14.9.1-linux-x64/jdk-11.0.14+9/bin/java /usr/local/bin/java11
  echo
  echo "[-] MicrosoftOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装MicrosoftOpenJDK17"

  echo "[↓] wget https://aka.ms/download-jdk/microsoft-jdk-17.0.2.8.1-linux-x64.tar.gz"
  wget https://aka.ms/download-jdk/microsoft-jdk-17.0.2.8.1-linux-x64.tar.gz

  echo "[↑] tar -zxf microsoft-jdk-17.0.2.8.1-linux-x64.tar.gz"
  tar -zxf microsoft-jdk-17.0.2.8.1-linux-x64.tar.gz

  echo "[x] rm -rf microsoft-jdk-17.0.2.8.1-linux-x64.tar.gz"
  rm -rf microsoft-jdk-17.0.2.8.1-linux-x64.tar.gz

  echo "[+] Creating a MicrosoftOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/microsoft-jdk-17.0.2.8.1-linux-x64/jdk-17.0.2+8/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/microsoft-jdk-17.0.2.8.1-linux-x64/jdk-17.0.2+8/bin/java /usr/local/bin/java17
  echo
  echo "[-] MicrosoftOpenJDK17 Installed Successfully!"
  echo

  echo "[-] MicrosoftOpenJDK Installed completely!"

  Finish
}

microsoft_x86() {
  echo "由于Microsoft并没有提供x86的包，所以请使用其他发行版"
  Choose_JDK
}

microsoft_arm64() {
  echo "由于Microsoft并没有8，所以将会安装11和17"
  echo "开始安装MicrosoftOpenJDK11"

  echo "[↓] wget https://aka.ms/download-jdk/microsoft-jdk-11.0.14.9.1-linux-aarch64.tar.gz"
  wget https://aka.ms/download-jdk/microsoft-jdk-11.0.14.9.1-linux-aarch64.tar.gz

  echo "[↑] tar -zxf microsoft-jdk-11.0.14.9.1-linux-aarch64.tar.gz"
  tar -zxf microsoft-jdk-11.0.14.9.1-linux-aarch64.tar.gz

  echo "[x] rm -rf microsoft-jdk-11.0.14.9.1-linux-aarch64.tar.gz"
  rm -rf microsoft-jdk-11.0.14.9.1-linux-aarch64.tar.gz

  echo "[+] Creating a MicrosoftOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/microsoft-jdk-11.0.14.9.1-linux-aarch64/jdk-11.0.14+9/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/microsoft-jdk-11.0.14.9.1-linux-aarch64/jdk-11.0.14+9/bin/java /usr/local/bin/java11
  echo
  echo "[-] MicrosoftOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装MicrosoftOpenJDK17"

  echo "[↓] wget https://aka.ms/download-jdk/microsoft-jdk-17.0.2.8.1-linux-aarch64.tar.gz"
  wget https://aka.ms/download-jdk/microsoft-jdk-17.0.2.8.1-linux-aarch64.tar.gz

  echo "[↑] tar -zxf microsoft-jdk-17.0.2.8.1-linux-aarch64.tar.gz"
  tar -zxf microsoft-jdk-17.0.2.8.1-linux-aarch64.tar.gz

  echo "[x] rm -rf microsoft-jdk-17.0.2.8.1-linux-aarch64.tar.gz"
  rm -rf microsoft-jdk-17.0.2.8.1-linux-aarch64.tar.gz

  echo "[+] Creating a MicrosoftOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/microsoft-jdk-17.0.2.8.1-linux-aarch64/jdk-17.0.2+8/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/microsoft-jdk-17.0.2.8.1-linux-aarch64/jdk-17.0.2+8/bin/java /usr/local/bin/java17
  echo
  echo "[-] MicrosoftOpenJDK17 Installed Successfully!"
  echo

  echo "[-] MicrosoftOpenJDK Installed completely!"

  Finish
}

semeru_x64() {
  echo "开始安装SemeruOpenJDK8"

  echo "[↓] wget https://github.com/ibmruntimes/semeru8-binaries/releases/download/jdk8u322-b06_openj9-0.30.0/ibm-semeru-open-jdk_x64_linux_8u322b06_openj9-0.30.0.tar.gz"
  wget https://github.com/ibmruntimes/semeru8-binaries/releases/download/jdk8u322-b06_openj9-0.30.0/ibm-semeru-open-jdk_x64_linux_8u322b06_openj9-0.30.0.tar.gz

  echo "[↑] tar -zxf ibm-semeru-open-jdk_x64_linux_8u322b06_openj9-0.30.0.tar.gz"
  tar -zxf ibm-semeru-open-jdk_x64_linux_8u322b06_openj9-0.30.0.tar.gz

  echo "[x] rm -rf ibm-semeru-open-jdk_x64_linux_8u322b06_openj9-0.30.0.tar.gz"
  rm -rf ibm-semeru-open-jdk_x64_linux_8u322b06_openj9-0.30.0.tar.gz

  echo "[+] Creating a SemeruOpenJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/ibm-semeru-open-jdk_x64_linux_8u322b06_openj9-0.30.0/jdk8u322-b06/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/ibm-semeru-open-jdk_x64_linux_8u322b06_openj9-0.30.0/jdk8u322-b06/bin/java /usr/local/bin/java8
  echo
  echo "[-] SemeruOpenJDK8 Installed Successfully!"
  echo

  echo "开始安装SemeruOpenJDK11"

  echo "[↓] wget https://github.com/ibmruntimes/semeru11-binaries/releases/download/jdk-11.0.14.1%2B1_openj9-0.30.1/ibm-semeru-open-jdk_x64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz"
  wget https://github.com/ibmruntimes/semeru11-binaries/releases/download/jdk-11.0.14.1%2B1_openj9-0.30.1/ibm-semeru-open-jdk_x64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz

  echo "[↑] tar -zxf ibm-semeru-open-jdk_x64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz"
  tar -zxf ibm-semeru-open-jdk_x64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz

  echo "[x] rm -rf ibm-semeru-open-jdk_x64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz"
  rm -rf ibm-semeru-open-jdk_x64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz

  echo "[+] Creating a SemeruOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/ibm-semeru-open-jdk_x64_linux_11.0.14.1_1_openj9-0.30.1/jdk-11.0.14.1+1/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/ibm-semeru-open-jdk_x64_linux_11.0.14.1_1_openj9-0.30.1/jdk-11.0.14.1+1/bin/java /usr/local/bin/java11
  echo
  echo "[-] SemeruOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装SemeruOpenJDK17"

  echo "[↓] wget https://github.com/ibmruntimes/semeru17-binaries/releases/download/jdk-17.0.2%2B8_openj9-0.30.0/ibm-semeru-open-jdk_x64_linux_17.0.2_8_openj9-0.30.0.tar.gz"
  wget https://github.com/ibmruntimes/semeru17-binaries/releases/download/jdk-17.0.2%2B8_openj9-0.30.0/ibm-semeru-open-jdk_x64_linux_17.0.2_8_openj9-0.30.0.tar.gz

  echo "[↑] tar -zxf ibm-semeru-open-jdk_x64_linux_17.0.2_8_openj9-0.30.0.tar.gz"
  tar -zxf ibm-semeru-open-jdk_x64_linux_17.0.2_8_openj9-0.30.0.tar.gz

  echo "[x] rm -rf ibm-semeru-open-jdk_x64_linux_17.0.2_8_openj9-0.30.0.tar.gz"
  rm -rf ibm-semeru-open-jdk_x64_linux_17.0.2_8_openj9-0.30.0.tar.gz

  echo "[+] Creating a SemeruOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/ibm-semeru-open-jdk_x64_linux_17.0.2_8_openj9-0.30.0/jdk-17.0.2+8/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/ibm-semeru-open-jdk_x64_linux_17.0.2_8_openj9-0.30.0/jdk-17.0.2+8/bin/java /usr/local/bin/java17
  echo
  echo "[-] SemeruOpenJDK17 Installed Successfully!"
  echo

  echo "[-] SemeruOpenJDK Installed completely!"

  Finish
}

semeru_x86() {
  echo "由于Semeru并没有提供x86的包，所以请使用其他发行版"
  Choose_JDK
}

semeru_arm64() {
  echo "开始安装SemeruOpenJDK8"

  echo "[↓] wget https://github.com/ibmruntimes/semeru8-binaries/releases/download/jdk8u322-b06_openj9-0.30.0/ibm-semeru-open-jdk_aarch64_linux_8u322b06_openj9-0.30.0.tar.gz"
  wget https://github.com/ibmruntimes/semeru8-binaries/releases/download/jdk8u322-b06_openj9-0.30.0/ibm-semeru-open-jdk_aarch64_linux_8u322b06_openj9-0.30.0.tar.gz

  echo "[↑] tar -zxf ibm-semeru-open-jdk_aarch64_linux_8u322b06_openj9-0.30.0.tar.gz"
  tar -zxf ibm-semeru-open-jdk_aarch64_linux_8u322b06_openj9-0.30.0.tar.gz

  echo "[x] rm -rf ibm-semeru-open-jdk_aarch64_linux_8u322b06_openj9-0.30.0.tar.gz"
  rm -rf ibm-semeru-open-jdk_aarch64_linux_8u322b06_openj9-0.30.0.tar.gz

  echo "[+] Creating a SemeruOpenJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/ibm-semeru-open-jdk_aarch64_linux_8u322b06_openj9-0.30.0/jdk8u322-b06/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/ibm-semeru-open-jdk_aarch64_linux_8u322b06_openj9-0.30.0/jdk8u322-b06/bin/java /usr/local/bin/java8
  echo
  echo "[-] SemeruOpenJDK8 Installed Successfully!"
  echo

  echo "开始安装SemeruOpenJDK11"

  echo "[↓] wget https://github.com/ibmruntimes/semeru11-binaries/releases/download/jdk-11.0.14.1%2B1_openj9-0.30.1/ibm-semeru-open-jdk_aarch64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz"
  wget https://github.com/ibmruntimes/semeru11-binaries/releases/download/jdk-11.0.14.1%2B1_openj9-0.30.1/ibm-semeru-open-jdk_aarch64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz

  echo "[↑] tar -zxf ibm-semeru-open-jdk_aarch64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz"
  tar -zxf ibm-semeru-open-jdk_aarch64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz

  echo "[x] rm -rf ibm-semeru-open-jdk_aarch64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz"
  rm -rf ibm-semeru-open-jdk_aarch64_linux_11.0.14.1_1_openj9-0.30.1.tar.gz

  echo "[+] Creating a SemeruOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/ibm-semeru-open-jdk_aarch64_linux_11.0.14.1_1_openj9-0.30.1/jdk-11.0.14.1+1/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/ibm-semeru-open-jdk_aarch64_linux_11.0.14.1_1_openj9-0.30.1/jdk-11.0.14.1+1/bin/java /usr/local/bin/java11
  echo
  echo "[-] SemeruOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装SemeruOpenJDK17"

  echo "[↓] wget https://github.com/ibmruntimes/semeru17-binaries/releases/download/jdk-17.0.2%2B8_openj9-0.30.0/ibm-semeru-open-jdk_aarch64_linux_17.0.2_8_openj9-0.30.0.tar.gz"
  wget https://github.com/ibmruntimes/semeru17-binaries/releases/download/jdk-17.0.2%2B8_openj9-0.30.0/ibm-semeru-open-jdk_aarch64_linux_17.0.2_8_openj9-0.30.0.tar.gz

  echo "[↑] tar -zxf ibm-semeru-open-jdk_aarch64_linux_17.0.2_8_openj9-0.30.0.tar.gz"
  tar -zxf ibm-semeru-open-jdk_aarch64_linux_17.0.2_8_openj9-0.30.0.tar.gz

  echo "[x] rm -rf ibm-semeru-open-jdk_aarch64_linux_17.0.2_8_openj9-0.30.0.tar.gz"
  rm -rf ibm-semeru-open-jdk_aarch64_linux_17.0.2_8_openj9-0.30.0.tar.gz

  echo "[+] Creating a SemeruOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/ibm-semeru-open-jdk_aarch64_linux_17.0.2_8_openj9-0.30.0/jdk-17.0.2+8/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/ibm-semeru-open-jdk_aarch64_linux_17.0.2_8_openj9-0.30.0/jdk-17.0.2+8/bin/java /usr/local/bin/java17
  echo
  echo "[-] SemeruOpenJDK17 Installed Successfully!"
  echo

  echo "[-] SemeruOpenJDK Installed completely!"

  Finish
}

dragonwell_x64() {
  echo "开始安装DragonwellOpenJDK8"

  echo "[↓] wget https://github.com/alibaba/dragonwell8/releases/download/dragonwell-8.10.11_jdk8u322-ga/Alibaba_Dragonwell_8.10.11_x64_linux.tar.gz"
  wget https://github.com/alibaba/dragonwell8/releases/download/dragonwell-8.10.11_jdk8u322-ga/Alibaba_Dragonwell_8.10.11_x64_linux.tar.gz

  echo "[↑] tar -zxf Alibaba_Dragonwell_8.10.11_x64_linux.tar.gz"
  tar -zxf Alibaba_Dragonwell_8.10.11_x64_linux.tar.gz

  echo "[x] rm -rf Alibaba_Dragonwell_8.10.11_x64_linux.tar.gz"
  rm -rf Alibaba_Dragonwell_8.10.11_x64_linux.tar.gz

  echo "[+] Creating a DragonwellOpenJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/Alibaba_Dragonwell_8.10.11_x64_linux/dragonwell-8.10.11/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/Alibaba_Dragonwell_8.10.11_x64_linux/dragonwell-8.10.11/bin/java /usr/local/bin/java8
  echo
  echo "[-] DragonwellOpenJDK8 Installed Successfully!"
  echo

  echo "开始安装DragonwellOpenJDK11"

  echo "[↓] wget https://dragonwell.oss-cn-shanghai.aliyuncs.com/11.0.14.10/Alibaba_Dragonwell_11.0.14.10_x64_linux.tar.gz"
  wget https://dragonwell.oss-cn-shanghai.aliyuncs.com/11.0.14.10/Alibaba_Dragonwell_11.0.14.10_x64_linux.tar.gz

  echo "[↑] tar -zxf Alibaba_Dragonwell_11.0.14.10_x64_linux.tar.gz"
  tar -zxf Alibaba_Dragonwell_11.0.14.10_x64_linux.tar.gz

  echo "[x] rm -rf Alibaba_Dragonwell_11.0.14.10_x64_linux.tar.gz"
  rm -rf Alibaba_Dragonwell_11.0.14.10_x64_linux.tar.gz

  echo "[+] Creating a DragonwellOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/Alibaba_Dragonwell_11.0.14.10_x64_linux/dragonwell-11.0.14.10+0-GA/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/Alibaba_Dragonwell_11.0.14.10_x64_linux/dragonwell-11.0.14.10+0-GA/bin/java /usr/local/bin/java11
  echo
  echo "[-] DragonwellOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装DragonwellOpenJDK17"

  echo "[↓] wget https://github.com/alibaba/dragonwell17/releases/download/dragonwell-17.0.1.0.1%2B12_jdk-17.0.1-ga/Alibaba_Dragonwell_17.0.1.0.1%2B12_x64_linux.tar.gz"
  wget https://github.com/alibaba/dragonwell17/releases/download/dragonwell-17.0.1.0.1%2B12_jdk-17.0.1-ga/Alibaba_Dragonwell_17.0.1.0.1%2B12_x64_linux.tar.gz

  echo "[↑] tar -zxf Alibaba_Dragonwell_17.0.1.0.1%2B12_x64_linux.tar.gz"
  tar -zxf Alibaba_Dragonwell_17.0.1.0.1%2B12_x64_linux.tar.gz

  echo "[x] rm -rf Alibaba_Dragonwell_17.0.1.0.1%2B12_x64_linux.tar.gz"
  rm -rf Alibaba_Dragonwell_17.0.1.0.1%2B12_x64_linux.tar.gz

  echo "[+] Creating a DragonwellOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/Alibaba_Dragonwell_17.0.1.0.1%2B12_x64_linux/jdk-17.0.1.0.1+12/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/Alibaba_Dragonwell_17.0.1.0.1%2B12_x64_linux/jdk-17.0.1.0.1+12/bin/java /usr/local/bin/java17
  echo
  echo "[-] DragonwellOpenJDK17 Installed Successfully!"
  echo

  echo "[-] DragonwellOpenJDK Installed completely!"

  Finish
}

dragonwell_x86() {
  echo "由于Dragonwell并没有提供x86的包，所以请使用其他发行版"
  Choose_JDK
}

dragonwell_arm64() {
  echo "开始安装DragonwellOpenJDK8"

  echo "[↓] wget https://github.com/alibaba/dragonwell8/releases/download/dragonwell-8.10.11_jdk8u322-ga/Alibaba_Dragonwell_8.10.11_aarch64_linux.tar.gz"
  wget https://github.com/alibaba/dragonwell8/releases/download/dragonwell-8.10.11_jdk8u322-ga/Alibaba_Dragonwell_8.10.11_aarch64_linux.tar.gz

  echo "[↑] tar -zxf Alibaba_Dragonwell_8.10.11_aarch64_linux.tar.gz"
  tar -zxf Alibaba_Dragonwell_8.10.11_aarch64_linux.tar.gz

  echo "[x] rm -rf Alibaba_Dragonwell_8.10.11_aarch64_linux.tar.gz"
  rm -rf Alibaba_Dragonwell_8.10.11_aarch64_linux.tar.gz

  echo "[+] Creating a DragonwellOpenJDK8 link"
  rm -f /usr/bin/java8
  ln -s ${java_install_path}/Alibaba_Dragonwell_8.10.11_aarch64_linux/dragonwell-8.10.11/bin/java /usr/bin/java8
  rm -f /usr/local/bin/java8
  ln -s ${java_install_path}/Alibaba_Dragonwell_8.10.11_aarch64_linux/dragonwell-8.10.11/bin/java /usr/local/bin/java8
  echo
  echo "[-] DragonwellOpenJDK8 Installed Successfully!"
  echo

  echo "开始安装DragonwellOpenJDK11"

  echo "[↓] wget https://dragonwell.oss-cn-shanghai.aliyuncs.com/11.0.14.10/Alibaba_Dragonwell_11.0.14.10_aarch64_linux.tar.gz"
  wget https://dragonwell.oss-cn-shanghai.aliyuncs.com/11.0.14.10/Alibaba_Dragonwell_11.0.14.10_aarch64_linux.tar.gz

  echo "[↑] tar -zxf Alibaba_Dragonwell_11.0.14.10_aarch64_linux.tar.gz"
  tar -zxf Alibaba_Dragonwell_11.0.14.10_aarch64_linux.tar.gz

  echo "[x] rm -rf Alibaba_Dragonwell_11.0.14.10_aarch64_linux.tar.gz"
  rm -rf Alibaba_Dragonwell_11.0.14.10_aarch64_linux.tar.gz

  echo "[+] Creating a DragonwellOpenJDK11 link"
  rm -f /usr/bin/java11
  ln -s ${java_install_path}/Alibaba_Dragonwell_11.0.14.10_aarch64_linux/dragonwell-11.0.14.10+0-GA/bin/java /usr/bin/java11
  rm -f /usr/local/bin/java11
  ln -s ${java_install_path}/Alibaba_Dragonwell_11.0.14.10_aarch64_linux/dragonwell-11.0.14.10+0-GA/bin/java /usr/local/bin/java11
  echo
  echo "[-] DragonwellOpenJDK11 Installed Successfully!"
  echo

  echo "开始安装DragonwellOpenJDK17"

  echo "[↓] wget https://github.com/alibaba/dragonwell17/releases/download/dragonwell-17.0.1.0.1%2B12_jdk-17.0.1-ga/Alibaba_Dragonwell_17.0.1.0.1%2B12_aarch64_linux.tar.gz"
  wget https://github.com/alibaba/dragonwell17/releases/download/dragonwell-17.0.1.0.1%2B12_jdk-17.0.1-ga/Alibaba_Dragonwell_17.0.1.0.1%2B12_aarch64_linux.tar.gz

  echo "[↑] tar -zxf Alibaba_Dragonwell_17.0.1.0.1%2B12_aarch64_linux.tar.gz"
  tar -zxf Alibaba_Dragonwell_17.0.1.0.1%2B12_aarch64_linux.tar.gz

  echo "[x] rm -rf Alibaba_Dragonwell_17.0.1.0.1%2B12_aarch64_linux.tar.gz"
  rm -rf Alibaba_Dragonwell_17.0.1.0.1%2B12_aarch64_linux.tar.gz

  echo "[+] Creating a DragonwellOpenJDK17 link"
  rm -f /usr/bin/java17
  ln -s ${java_install_path}/Alibaba_Dragonwell_17.0.1.0.1%2B12_aarch64_linux/jdk-17.0.1.0.1+12/bin/java /usr/bin/java17
  rm -f /usr/local/bin/java17
  ln -s ${java_install_path}/Alibaba_Dragonwell_17.0.1.0.1%2B12_aarch64_linux/jdk-17.0.1.0.1+12/bin/java /usr/local/bin/java17
  echo
  echo "[-] DragonwellOpenJDK17 Installed Successfully!"
  echo

  echo "[-] DragonwellOpenJDK Installed completely!"

  Finish
}


Finish() {
  echo "已安装完成，可以通过java8,java11,java17进行调用"
  exit 1
}


if [ $(whoami) != "root" ]; then
  Red_Error "[x] 请使用Root账户安装，通常在命令前加入'sudo '即可使用Root权限运行程序"
fi


Get_Pack_Manager(){
	if [ -f "/usr/bin/yum" ] && [ -d "/etc/yum.repos.d" ]; then
		PM="yum -y"
  	elif [ -f "/usr/bin/apt" ] && [ -f "/usr/bin/dpkg" ]; then
		PM="apt -y"
  	elif [ -f "/usr/bin/pacman" ]; then
		PM="pacman -S --noconfirm"
  	elif [ -f "/usr/bin/apk" ]; then
		Red_Error "本安装脚本暂不支持alpine"
	fi
}

echo "+----------------------------------------------------------------------
| JDK Install
+----------------------------------------------------------------------
| Shell Install Script by OldGodShen
+----------------------------------------------------------------------
"

echo "本程序将会自动安装Java8,Java11,Java17"
echo "安装完成后，可以通过java8,java11,java17进行调用"

Get_Pack_Manager
echo "[+] 安装tar,ca-certificates,wget"
$PM tar wget ca-certificates unzip

Choose_JDK
