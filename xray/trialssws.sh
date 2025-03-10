#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 

BURIQ () {
    curl -sS https://raw.githubusercontent.com/jonesroot/izin/main/izin > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/jonesroot/izin/main/izin | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/jonesroot/izin/main/izin | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi


clear
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=trial-ss`</dev/urandom tr -dc 0-9 | head -c4`
cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
Quota=5
iplimit=2
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#ssws$/a\#ss# '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#ssgrpc$/a\#ss# '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
echo $cipher:$uuid > /tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 > /tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
shadowsockslink="ss://${shadowsocks_base64e}@isi_bug_disini:$tls?path=ss-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
shadowsockslink2="ss://${shadowsocks_base64e}@isi_bug_disini:$ntls?path=ss-ws&security=tls&host=${domain}&type=ws#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@${domain}:$tls?mode=gun&security=tls&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
if [ ! -e /etc/shadowsocks ]; then
  mkdir -p /etc/shadowsocks
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi
if [ -z ${iplimit} ]; then
  iplimit="0"
fi
c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/shadowsocks/${user}
  echo "${iplimit}" >/etc/kyt/limit/shadowsocks/ip/$user
fi
DATADB=$(cat /etc/shadowsocks/.shadowsocks.db | grep "^#ss#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/shadowsocks/.shadowsocks.db
fi
echo "#ss# ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/shadowsocks/.shadowsocks.db
clear

#if [ ! -e /etc/shadowsocks ]; then
#mkdir -p /etc/shadowsocks
#fi

#if [[ $quota -gt 0 ]]; then
#echo -e "$[$quota * 1024 * 1024 * 1024]" > /etc/kyt/limit/shadowsocks/quota/$user
#else
#echo > /dev/null
#fi

#if [[ $iplimit -gt 0 ]]; then
#mkdir -p /etc/kyt/limit/shadowsocks/ip
#echo -e "$iplimit" > /etc/kyt/limit/shadowsocks/ip/$user
#else
#echo > /dev/null
#fi

#if [ -z ${Quota} ]; then
#Quota="0"
#fi

#c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
#d=$((${c} * 1024 * 1024 * 1024))

#if [[ ${c} != "0" ]]; then
#echo "${d}" >/etc/shadowsocks/${user}
#fi
#DATADB=$(cat /etc/shadowsocks/.shadowsocks.db | grep "^#ss#" | grep -w "${user}" | awk '{print $2}')
#if [[ "${DATADB}" != '' ]]; then
#sed -i "/\b${user}\b/d" /etc/shadowsocks/.shadowsocks.db
#fi
#echo "#ss# ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/shadowsocks/.shadowsocks.db
#echo "#ss# ${user} ${exp} ${uuid} ${Quota}" >>/etc/shadowsocks/.shadowsocks.db

#clear
echo -e "${CYAN}╒════════════════════════════════════════╕${NC}" 
echo -e "${BIWhite}            ⇱ SHADOWSOCKS ACCOUNT ⇲            ${NC}"
echo -e "${CYAN}╘════════════════════════════════════════╛${NC}"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "User Quota     : ${Quota} GB"
echo -e "User Ip        : ${iplimit} IP"
echo -e "Wildcard       : (bug.com).${domain}"
echo -e "Port TLS       : 443"
echo -e "Port none TLS  : 80"
echo -e "Port gRPC      : 443"
echo -e "Password       : ${uuid}"
echo -e "Ciphers        : ${cipher}"
echo -e "Network        : ws/grpc"
echo -e "Path           : /ss-ws"
echo -e "ServiceName    : ss-grpc"
echo -e "${BIWhite}══════════════════════════════════════════${NC}"
echo -e "Link TLS       : ${shadowsockslink}"
echo -e "${BIWhite}══════════════════════════════════════════${NC}"
echo -e "Link none TLS  : ${shadowsockslink2}"
echo -e "${BIWhite}══════════════════════════════════════════${NC}"
echo -e "Link gRPC      : ${shadowsockslink1}"
echo -e "${BIWhite}══════════════════════════════════════════${NC}"
echo -e "Expired On     : $exp"
echo -e "Regulation     : No ddos No torrent No porn"
echo -e "${BIWhite}══════════════════════════════════════════${NC}"
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssws
