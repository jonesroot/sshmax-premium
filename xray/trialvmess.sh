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
tls="$(cat ~/log-install.txt | grep -w "Vmess WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=trial-vm`</dev/urandom tr -dc 0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
Quota=5
iplimit=2
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\#vm# '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\#vm# '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi
if [ -z ${iplimit} ]; then
  iplimit="0"
fi
if [ -z ${Quota} ]; then
  Quota="0"
fi
c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))
if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vmess/${user}
  echo "${iplimit}" >/etc/kyt/limit/vmess/ip/$user
fi
DATADB=$(cat /etc/vmess/.vmess.db | grep "^#vm#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "#vm# ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vmess/.vmess.db
clear

#if [ ! -e /etc/vmess ]; then
#mkdir -p /etc/vmess
#fi

#if [[ $quota -gt 0 ]]; then
#echo -e "$[$quota * 1024 * 1024 * 1024]" > /etc/kyt/limit/vmess/quota/$user
#else
#echo > /dev/null
#fi

#if [[ $iplimit -gt 0 ]]; then
#mkdir -p /etc/kyt/limit/vmess/ip
#echo -e "$iplimit" > /etc/kyt/limit/vmess/ip/$user
#else
#echo > /dev/null
#fi

#if [ -z ${Quota} ]; then
#Quota="0"
#fi

#c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
#d=$((${c} * 1024 * 1024 * 1024))

#if [[ ${c} != "0" ]]; then
#echo "${d}" >/etc/vmess/${user}
#fi
#DATADB=$(cat /etc/vmess/.vmess.db | grep "^#vm#" | grep -w "${user}" | awk '{print $2}')
#if [[ "${DATADB}" != '' ]]; then
#sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
#fi
#echo "#vm# ${user} ${exp} ${uuid} ${Quota}" >>/etc/vmess/.vmess.db
#echo "#vm# ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vmess/.vmess.db
#clear


echo -e "${CYAN}╒════════════════════════════════════════╕${NC}" 
echo -e "${BIWhite}            ⇱ VMESS ACCOUNT ⇲            ${NC}"
echo -e "${CYAN}╘════════════════════════════════════════╛${NC}"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "User Quota     : ${Quota} GB"
echo -e "User Ip        : ${iplimit} IP"
echo -e "Wildcard       : (bug.com).${domain}"
echo -e "Port TLS       : 443"
echo -e "Port none TLS  : 80"
echo -e "Port gRPC      : 443"
echo -e "id             : ${uuid}"
echo -e "alterId        : 0"
echo -e "Security       : auto"
echo -e "Network        : ws"
echo -e "Path           : /vmess"
echo -e "ServiceName    : vmess-grpc"
echo -e "${BIWhite}══════════════════════════════════════════${NC}"
echo -e "Link TLS       : ${vmesslink1}"
echo -e "${BIWhite}══════════════════════════════════════════${NC}"
echo -e "Link none TLS  : ${vmesslink2}"
echo -e "${BIWhite}══════════════════════════════════════════${NC}"
echo -e "Link gRPC      : ${vmesslink3}"
echo -e "${BIWhite}══════════════════════════════════════════${NC}"
echo -e "Expired On     : $exp"
echo -e "Regulation     : No ddos No torrent No porn"
echo -e "${BIWhite}══════════════════════════════════════════${NC}"
echo ""

read -n 1 -s -r -p "Press any key to back on menu"

menu-vmess
