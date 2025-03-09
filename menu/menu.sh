#!/bin/bash
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

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/jonesroot/izin/main/izin | grep $MYIP | awk '{print $3}')
fi

# =========================================
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^#vm# " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2

UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
# // Exporting Language to UTF-8
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear

# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
USAGERAM=$(free -m | awk 'NR==2 {print $3}')

persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
#persencpu=
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"


# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
function addhost(){
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
setting-menu
else
echo "IP=$host" > /var/lib/SIJA/ipvps.conf
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew cert"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
}
function genssl(){
clear
systemctl stop nginx
domain=$(cat /var/lib/SIJA/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /etc/xray/domain
systemctl restart xray
systemctl restart nginx
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
export sem=$( curl -s https://raw.githubusercontent.com/ALVIICELL/permission/main/versions)
export pak=$( cat /home/.ver)
IPVPS=$(curl -s ipinfo.io/ip )
clear
#figlet  PREMIUM  | lolcat
#echo -e "${BIPurple}╔══════════════════════════════════════════════════════════╗\033[0m${NC}"
#echo -e "${BIRed}                       CLOUDVPN  TUNNEL                      ${NC}"
#echo -e "${BIPurple}╚══════════════════════════════════════════════════════════╝\033[0m${NC}"
echo -e "${BIYellow}╔═══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BIYellow}║${NC}\033[1;93m         Welcome To Script Premium SSHMAX           $NC${BIYellow}║$NC"
echo -e "${BIYellow}╚═══════════════════════════════════════════════════════════╝${NC}"
echo -e "${BIYellow}╔═══════════════════════════════════════════════════════════╗\033[0m${NC}"
echo -e "${BIYellow}║ Server Uptime       = ${BIWhite}$( uptime -p  | cut -d " " -f 2-10000 ) ${NC}"
echo -e "${BIYellow}║ Current Time        = ${BIWhite}$( date -d "0 days" +"%d-%m-%Y | %X" )${NC}"
echo -e "${BIYellow}║ Operating System    = ${BIWhite}$( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )${NC}"
echo -e "${BIYellow}║ IP VPS              = ${BIWhite}$IPVPS${NC}"
echo -e "${BIYellow}║ Current Domain      = ${BIWhite}$( cat /etc/xray/domain )${NC}"
echo -e "${BIYellow}║ NS Domain           = ${BIWhite}$(cat /root/nsdomain)${NC}"
echo -e "${BIYellow}║ RAM/USE RAM % CPU   = ${BIWhite}${totalram}MB / ${BIWhite}${USAGERAM} MB & ${BIWhite}${cpu_usage}${NC}"
#echo -e "${BIYellow}║ CPU Usage           = ${BIWhite}${cpu_usage}${NC}"
echo -e "${BIYellow}╚═══════════════════════════════════════════════════════════╝\033[0m${NC}"
DATE=$(date +'%d %B %Y')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
echo -e " ${BIRed}║  DAYS LEFT    ${NC} : ${IYellow}$(( (d1 - d2) / 86400 )) Days $NC"
}
mai="datediff "$Exp" "$DATE""
echo -e " ${BIRed}╔══════════════════════════════════════════════════════════${NC}"
echo -e " ${BIRed}║  User ORDER   ${NC} : ${IWhite}$Name${NC}"
echo -e " ${BIRed}║  Date EXP     ${NC} : ${IWhite}$Exp${NC}"
if [ $exp \< 1000 ]; 
then
echo -e " ${BIRed}│$NC     License      : ${IWhite}$sisa_hari$NC Days Tersisa $NC"
else
    datediff "$Exp" "$DATE"
fi;
echo -e " ${BIRed}╚══════════════════════════════════════════════════════════${NC}"
echo -e " ${BIWhite}                 SSH OVPN: $ssh1  VMESS: $vma $NC"
echo -e " ${BIWhite}              VLESS: $vla TROJAN: $tra SHADWSK: $ssa $NC"
echo -e "${BIBlack}╔═════════════════════════════════════════════════════════╗${NC}"
echo -e "      ${red}SSH Websocket${NC} : $ressshws""   ${red}NGINX${NC} : $resngx""  ${red}XRAY${NC} : $resv2r"
echo -e "${BIBlack}╚═════════════════════════════════════════════════════════╝${NC}"
#echo -e "     ${BICyan} SSH ${NC}: $ressh"" ${BICyan} NGINX ${NC}: $resngx"" ${BICyan}  XRAY ${NC}: $resv2r"" ${BICyan} TROJAN ${NC}: $resv2r"
#echo -e "   ${BICyan}     STUNNEL4 ${NC}: $resst" "${BICyan} DROPBEAR ${NC}: $resdbr" "${BICyan} SSH-WS ${NC}: $ressshws"
echo -e "${BIYellow}   ╔══════════════════════════════════════════════════════╗${NC}"
echo -e "     ${BIYellow}[${BIWhite}1]${red}🌦 SSH    " "  ${BICyan}[${BIWhite}6]${red}🌦 SETTING  " " ${BICyan}[${BIWhite}11${red}]🌦 SET REBOOT"
echo -e "     ${BIYellow}[${BIWhite}2]${red}🌦 VMESS  " "  ${BICyan}[${BIWhite}7]${red}🌦 TRIAL    " " ${BICyan}[${BIWhite}12${red}]🔐 SET PW VPS"
echo -e "     ${BIYellow}[${BIWhite}3]${red}🌦 VLESS  " "  ${BICyan}[${BIWhite}8]${red}🌦 BACKUP   " " ${BICyan}[${BIWhite}13${red}]🌦 UPDATE SC "
echo -e "     ${BIYellow}[${BIWhite}4]${red}🌦 TROJAN " "  ${BICyan}[${BIWhite}9]${red}🌦 ADD-HOST " " ${BICyan}[${BIWhite}99${red}]🌦 CLEAR SAMPAH"
echo -e "     ${BIYellow}[${BIWhite}5]${red}🌦 SHDSCK " "  ${BICyan}[${BIWhite}10]${red}🌦 RUNNING"
echo -e "${BIYellow}   ╚══════════════════════════════════════════════════════╝${NC}"
echo -e "${BIBlack} ╔═════════════════════════════════════════════════════╗${NC}"
echo -e "${BIBlack} ║$NC ${IWhite}TODAY${NC}: ${red}$ttoday$NC ${IWhite}YESTERDAY${NC}: ${red}$tyest$NC ${IWhite}MONTHLY${NC}: ${red}$tmon$NC $NC"
echo -e "${BIBlack} ╚═════════════════════════════════════════════════════╝${NC}"
echo
read -p " Choose menu Leader : " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-ssws ;;
6) clear ; menu-set ;;
7) clear ; menu-trial ;;
8) clear ; menu-backup ;;
9) clear ; addhost ;;
10) clear ; running ;;
11) clear ; jam ;;
12) clear ; passwd ;;
13) clear ; up ;;
99) clear ; clearcache ;;
6969) clear ; wget https://raw.githubusercontent.com/ALVIICELL/1/main/update.sh && chmod +x update.sh && ./update.sh && rm -f /root/update.sh ;;
0) clear ; menu ;;
x) exit ;;
esac