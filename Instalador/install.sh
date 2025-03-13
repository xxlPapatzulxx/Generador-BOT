
##!/bin/bashlink
#Instalador del BOT
coo=1
IVAR="/etc/http-instas"
SCPT_DIR="/etc/SCRIPT"
rm -f gera*
source <(curl -sSL https://raw.githubusercontent.com/xxlPapatzulxx/Generador-BOT/main/Otros/msg) >/dev/null
#!/bin/bash

# menu maker (opciones 1, 2, 3,.....)

flech='➮' cOlM='⁙' && TOP='‣' && TTini='=====>>►► 🐲' && TTfin='🐲 ◄◄<<=====' && TTcent='💥' && RRini='【  ★' && RRfin='★  】' && CHeko='✅' && ScT='🛡️' && FlT='⚔️' && BoLCC='🪦' && ceLL='🧬' && aLerT='⚠️' && lLaM='🔥' && pPIniT='∘' && bOTg='🤖' && rAy='⚡' && tTfIn='】' && TtfIn='【' tTfLe='►' && rUlq='🔰' && h0nG='🍄' && lLav3='🗝️' && m3ssg='📩' && pUn5A='⚜' && p1t0='•'
cOpyRig='©' && mbar2=' •••••••••••••••••••••••'

menu_func() {
    local options=${#@}
    local array
    for ((num = 1; num <= $options; num++)); do
        echo -ne "$(msg -verd " [$num]") $(msg -verm2 ">") "
        array=(${!num})
        case ${array[0]} in
        "-vd") echo -e "\033[1;33m[!]\033[1;32m ${array[@]:1}" ;;
        "-vm") echo -e "\033[1;33m[!]\033[1;31m ${array[@]:1}" ;;
        "-fi") echo -e "${array[@]:2} ${array[1]}" ;;
        -bar | -bar2 | -bar3 | -bar4) echo -e "\033[1;37m${array[@]:1}\n$(msg ${array[0]})" ;;
        *) echo -e "\033[1;37m${array[@]}" ;;
        esac
    done
}

selection_fun() {
    local selection="null"
    local range
    for ((i = 0; i <= $1; i++)); do range[$i]="$i "; done
    while [[ ! $(echo ${range[*]} | grep -w "$selection") ]]; do
        echo -ne "\033[1;37m ► Opcion : " >&2
        read selection
        tput cuu1 >&2 && tput dl1 >&2
    done
    echo $selection
}

tittle() {
    [[ -z $1 ]] && rt='adm-lite' || rt='ADMcgh'
    clear && clear
    msg -bar
    echo -e "\033[1;44;44m   \033[1;33m=====>>►► 🐲 xxlPapatzulxx 💥 Plus 🐲 ◄◄<<=====  \033[0m \033[0;33m[$(less /etc/${rt}/v-local.log)]"
    msg -bar
}
in_opcion() {
    unset opcion
    if [[ -z $2 ]]; then
        msg -nazu " $1: " >&2
    else
        msg $1 " $2: " >&2
    fi
    read opcion
    echo "$opcion"
}
# centrado de texto
print_center() {
    if [[ -z $2 ]]; then
        text="$1"
    else
        col="$1"
        text="$2"
    fi

    while read line; do
        unset space
        x=$(((54 - ${#line}) / 2))
        for ((i = 0; i < $x; i++)); do
            space+=' '
        done
        space+="$line"
        if [[ -z $2 ]]; then
            msg -azu "$space"
        else
            msg "$col" "$space"
        fi
    done <<<$(echo -e "$text")
}
# titulos y encabesados
title() {
    clear
    msg -bar
    if [[ -z $2 ]]; then
        print_center -azu "$1"
    else
        print_center "$1" "$2"
    fi
    msg -bar
}

# finalizacion de tareas
enter() {
    msg -bar
    text="►► Presione enter para continuar ◄◄"
    if [[ -z $1 ]]; then
        print_center -ama "$text"
    else
        print_center "$1" "$text"
    fi
    read
}

# opcion, regresar volver/atras
back() {
    msg -bar
    echo -ne "$(msg -verd " [0]") $(msg -verm2 ">") " && msg -bra "\033[1;41mVOLVER"
    msg -bar
}

msg() {
    local colors="/etc/new-adm-color"
    if [[ ! -e $colors ]]; then
        COLOR[0]='\033[1;37m' #BRAN='\033[1;37m'
        COLOR[1]='\e[31m'     #VERMELHO='\e[31m'
        COLOR[2]='\e[32m'     #VERDE='\e[32m'
        COLOR[3]='\e[33m'     #AMARELO='\e[33m'
        COLOR[4]='\e[34m'     #AZUL='\e[34m'
        COLOR[5]='\e[35m'     #MAGENTA='\e[35m'
        COLOR[6]='\033[1;97m' #MAG='\033[1;36m'
        COLOR[7]='\033[1;49;95m'
        COLOR[8]='\033[1;49;96m'
    else
        local COL=0
        for number in $(cat $colors); do
            case $number in
            1) COLOR[$COL]='\033[1;37m' ;;
            2) COLOR[$COL]='\e[31m' ;;
            3) COLOR[$COL]='\e[32m' ;;
            4) COLOR[$COL]='\e[33m' ;;
            5) COLOR[$COL]='\e[34m' ;;
            6) COLOR[$COL]='\e[35m' ;;
            7) COLOR[$COL]='\033[1;36m' ;;
            8) COLOR[$COL]='\033[1;49;95m' ;;
            9) COLOR[$COL]='\033[1;49;96m' ;;
            esac
            let COL++
        done
    fi
    NEGRITO='\e[1m'
    SEMCOR='\e[0m'
    case $1 in
    -ne) cor="${COLOR[1]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
    -ama) cor="${COLOR[3]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -verm) cor="${COLOR[3]}${NEGRITO}[!] ${COLOR[1]}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -verm2) cor="${COLOR[1]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -aqua) cor="${COLOR[8]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -azu) cor="${COLOR[6]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -verd) cor="${COLOR[2]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -bra) cor="${COLOR[0]}${SEMCOR}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -nazu) cor="${COLOR[6]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
    -nverd) cor="${COLOR[2]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
    -nama) cor="${COLOR[3]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
    -verm3) cor="${COLOR[1]}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -teal) cor="${COLOR[7]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -teal2) cor="${COLOR[7]}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -blak) cor="${COLOR[8]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -blak2) cor="${COLOR[8]}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -blu) cor="${COLOR[9]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
    -blu1) cor="${COLOR[9]}" && echo -e "${cor}${2}${SEMCOR}" ;;
    #-bar)ccor="${COLOR[1]}•••••••••••••••••••••••••••••••••••••••••••••••••" && echo -e "${SEMCOR}${ccor}${SEMCOR}";;
    -bar) ccor="${COLOR[1]}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" && echo -e "${SEMCOR}${ccor}${SEMCOR}" ;;
    -bar1) ccor="${COLOR[1]}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" && echo -e "${SEMCOR}${ccor}${SEMCOR}" ;;
    -bar2) ccor="${COLOR[1]}=====================================================" && echo -e "${SEMCOR}${ccor}${SEMCOR}" ;;
    -bar3) ccor="${COLOR[3]}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" && echo -e "${SEMCOR}${ccor}${SEMCOR}" ;;
    -bar4) ccor="${COLOR[5]}•••••••••••••••••••••••••••••••••••••••••••••••••" && echo -e "${SEMCOR}${ccor}${SEMCOR}" ;;
    esac
}

fun_bar() {
    comando[0]="$1"
    comando[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${comando[0]} -y >/dev/null 2>&1
        ${comando[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    echo -ne "\033[1;33m ["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[1;31m##"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[1;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "\033[1;33m ["
    done
    echo -e "\033[1;33m]\033[1;31m -\033[1;32m 100%\033[1;37m"
}

del() {
    for ((i = 0; i < $1; i++)); do
        tput cuu1 && tput dl1
    done
}

[[ -d /bin/ejecutar ]] && {
    [[ -e /bin/ejecutar/msg ]] || wget -q -O /bin/ejecutar/msg https://raw.githubusercontent.com/xxlPapatzulxx/Generador-BOT/main/Otros/msg
} || mkdir /bin/ejecutar
cor[0]="\033[0m"
cor[1]="\033[1;34m"
cor[2]="\033[1;32m"
cor[3]="\033[1;37m"
cor[4]="\033[1;36m"
cor[5]="\033[1;33m"
cor[6]="\033[1;35m"
export -f msg
export -f fun_bar
export -f tittle
export -f enter
export -f back
export -f print_center
export -f in_opcion
export -f del

add-apt-repository universe
apt update -y
apt upgrade -y

install_ini() {
    clear
    msg -bar
    echo -e "\033[92m        -- INSTALANDO PAQUETES NECESARIOS -- "
    msg -bar
    ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    locale-gen en_US.UTF-8 >/dev/null 2>&1
    update-locale LANG=en_US.UTF-8 >/dev/null 2>&1
    echo -e "\033[97m  # Instalando  UTF...................... $ESTATUS "
    apt-get install gawk -y >/dev/null 2>&1
    #bc
    [[ $(dpkg --get-selections | grep -w "jq" | head -1) ]] || apt-get install jq -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "jq" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "jq" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install jq................... $ESTATUS "
    #SCREEN
    [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || apt-get install screen -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install screen............... $ESTATUS "
    #apache2
    [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] || {
        apt-get install apache2 -y &>/dev/null
        sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
        service apache2 restart >/dev/null 2>&1 &
    }
    [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install apache2.............. $ESTATUS "
    #curl
    [[ $(dpkg --get-selections | grep -w "curl" | head -1) ]] || apt-get install curl -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "curl" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "curl" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install curl................. $ESTATUS "
    #socat
    [[ $(dpkg --get-selections | grep -w "socat" | head -1) ]] || apt-get install socat -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "socat" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "socat" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install socat................ $ESTATUS "
    #netcat
    [[ $(dpkg --get-selections | grep -w "netcat" | head -1) ]] || apt-get install netcat -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "netcat" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "netcat" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install netcat............... $ESTATUS "
    #netcat-traditional
    [[ $(dpkg --get-selections | grep -w "netcat-traditional" | head -1) ]] || apt-get install netcat-traditional -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "netcat-traditional" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "netcat-traditional" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install netcat-traditional... $ESTATUS "
    #net-tools
    [[ $(dpkg --get-selections | grep -w "net-tools" | head -1) ]] || apt-get install net-tools -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "net-tools" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "net-tools" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install net-tools............ $ESTATUS "
    #cowsay
    [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || apt-get install cowsay -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install cowsay............... $ESTATUS "
    #figlet
    [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || apt-get install figlet -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install figlet............... $ESTATUS "
    #lolcat
    apt-get install lolcat -y &>/dev/null
    sudo gem install lolcat &>/dev/null
    [[ $(dpkg --get-selections | grep -w "lolcat" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "lolcat" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install lolcat............... $ESTATUS "
    #PV
    [[ $(dpkg --get-selections | grep -w "pv" | head -1) ]] || apt-get install pv -y &>/dev/null
    [[ $(dpkg --get-selections | grep -w "pv" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "pv" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
    echo -e "\033[97m  # apt-get install PV   ................ $ESTATUS "
    msg -bar
    echo -e "\033[92m La instalacion de paquetes necesarios a finalizado"
    msg -bar
    echo -e "\033[97m Si la instalacion de paquetes tiene fallas"
    echo -ne "\033[97m     Reintentar Install Paquetes [ s/n ]: "
    read inst
    [[ $inst = @(s|S|y|Y) ]] && install_ini
}

check_ip() {
    MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
    MIP2=$(wget -qO- ipv4.icanhazip.com)
    [[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
    echo "$IP" >/usr/bin/vendor_code
}
function_verify() {
    unset keybot
    msg -bar
    [[ ! -e /etc/nivbot ]] && echo >/etc/nivbot
    echo -e "\e[31m          BOTGEN LIBRE TE LO VENDIERON ?\e[32m"
    [[ "$(echo "$(cat </etc/nivbot)")" < "3" ]] && {
        [[ -e /bin/downloadbot ]] && {
            [[ -z $(cat </bin/downloadbot) ]] && read -p " DIGITE SI O NO : " keybot || unset keybot
        }
    } || read -p " DIGITE SI O NO: " keybot
    [[ -z $keybot ]] && {
        [[ -e /bin/downloadbot ]] && link="$(cat </bin/downloadbot)" || link='https://raw.githubusercontent.com'
        [[ $link = 'https://raw.githubusercontent.com' ]] && echo "CONTROL MEDIANTE GitHub" || echo "CONTROL EXTERNO"
        permited=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/Bot/Control-Bot")
    } || {
        permited=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/Bot/Control-Bot")
        [[ -z $keybot ]] && echo $link >/bin/downloadbot || echo -e "$(ofus $keybot)" >/bin/downloadbot
    }
    permited=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/Bot/Control-Bot")
    [[ $(echo $permited | grep "${IP}") = "" ]] || {
        clear
        msg -bar
        echo -e "\n"
        echo -e "\e[31m    LA IP $(wget -qO- ipv4.icanhazip.com) FUE RECHAZADA!"
        echo -e " $link No AUTORIZADA el ACCESO "
        echo -e " SI DESEAS USAR EL BOTGEN CONTACTE A @Jerry_SBG"
        msg -bar
        [[ -e "/bin/ShellBot.sh" ]] && rm /bin/ShellBot.sh
        [[ -e /bin/downloadbot ]] && rm -f /bin/downloadbot
        echo -e "\n"
        msg -bar
        exit 1
    } && {
        ### INTALAR VERCION DE SCRIPT
        clear && clear
        msg -bar
        echo -e "\e[32m      LA IP $(wget -qO- ipv4.icanhazip.com) ESTA AUTORIZADA!"
        [[ -e /usr/bin/downBase ]] || echo 'https://raw.githubusercontent.com/xxlPapatzulxx/premium-botT/main/Otros/lista' >/usr/bin/downBase && chmod 777 /usr/bin/downBase
        v1=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/adm-lite/v-local.log")
        [[ ! -e /bin/downloadbot ]] && {
            [[ $link = 'https://raw.githubusercontent.com' ]] && echo "https://raw.githubusercontent.com" >/bin/downloadbot || echo "$(ofus $keybot)" >/bin/downloadbot
            chmod +x /bin/downloadbot
        }
        [[ -e /etc/nivbot ]] && {
            i=$(cat </etc/nivbot)
            lv=$(($i + 1))
            echo $lv >/etc/nivbot
        } || echo "1" >/etc/nivbot
        echo $Key >/etc/valkey && chmod +x /etc/valkey
        [[ -e /usr/bin/downBase ]] || echo 'https://raw.githubusercontent.com/xxlPapatzulxx/premium-bot/main/Otros/lista' >/usr/bin/downBase && chmod 777 /usr/bin/downBase
        [[ -e /bin/ShellBot.sh ]] && wget -O /bin/ShellBot.sh https://raw.githubusercontent.com/xxlPapatzulxx/Generador-BOT/main/Otros/ShellBot.sh >/dev/null && chmod +rwx /bin/ShellBot.sh

        sleep 3s
    }

}

echo '0' >/etc/http-instas 
[[ -d $SCPT_DIR ]] && rm -rf $SCPT_DIR

#CORES
cor[1]="\033[1;36m"
cor[2]="\033[1;32m"
cor[3]="\033[1;31m"
cor[4]="\033[1;33m"
cor[0]="\033[1;37m"

#TEXTOS

#COMPARA
fun_filez() {
    fup="$HOME/update"
    echo "$1" >>$HOME/files.log

    wget -O /bin/http-server.sh https://raw.githubusercontent.com/xxlPapatzulxx/Generador-BOT/main/Bot/http-server.py  && chmod +x /bin/http-server.sh
    [[ -e $1 ]] && mv -f ${fup}/$1 /etc/SCRIPT/$1
}

ofus() {
    unset txtofus
    number=$(expr length $1)
    for ((i = 1; i < $number + 1; i++)); do
        txt[$i]=$(echo "$1" | cut -b $i)
        case ${txt[$i]} in
        ".") txt[$i]="v" ;;
        "v") txt[$i]="." ;;
        "1") txt[$i]="@" ;;
        "@") txt[$i]="1" ;;
        "2") txt[$i]="?" ;;
        "?") txt[$i]="2" ;;
        "4") txt[$i]="p" ;;
        "p") txt[$i]="4" ;;
        "-") txt[$i]="L" ;;
        "L") txt[$i]="-" ;;
        esac
        txtofus+="${txt[$i]}"
    done
    echo "$txtofus" | rev
}

DOWS() {
    wget -O /root/lista https://raw.githubusercontent.com/xxlPapatzulxx/premium-bot/main/Otros/lista
    wget --no-check-certificate -i $HOME/lista
}

function aguarde() {
    sleep 1
    fun_ejec=$1
    helice() {
        DOWS >/dev/null 2>&1 &
        tput civis
        while [ -d /proc/$! ]; do
            for i in / - \\ \|; do
                sleep .1
                echo -ne "\e[1D$i"
            done
        done
        tput cnorm
    }
    echo -ne "\033[1;37m TRASLADANDO FILES \033[1;32mSCRIPT \033[1;37me \033[1;32mAUTOGEN\033[1;32m.\033[1;33m.\033[1;31m. \033[1;33m"
    helice
    echo -e "\e[1D REALIZADO"
}

atualiza_fun() {
    msg -bar
    [[ -d ./update ]] && rm -rf ./update/* || mkdir ./update
    cd ./update/
    aguarde
    unset arqs
    n=1
    rm -f $HOME/files.log
    for arqs in $(ls $HOME/update); do
        echo -ne "\033[1;33m FILE \e[32m [${n}.gen] \e[0m "
        fun_filez $arqs >/dev/null 2>&1 && echo -e "\033[1;31m- \033[1;31m $arqs (no Trasladado!)" || echo -e "\033[1;31m- \033[1;32m $arqs Trasladado!"
        n=$(($n + 1))
    done
    mkdir -p /etc/SCRIPT
    mv -f /root/update/* /etc/SCRIPT/
    wget -q -O /usr/bin/sbg https://raw.githubusercontent.com/xxlPapatzulxx/Generador-BOT/main/Menu-Bash/gerador.sh && chmod +x /usr/bin/sbg
    cd $HOME
    msg -bar
    echo -e "\033[1;92m           DIGITE EL COMANDO: \033[1;33msbg  "
    msg -bar
    [[ -e $HOME/lista ]] && rm $HOME/lista
    [[ -d $HOME/update ]] && rm -rf $HOME/update
}

unset Key
[[ $1 = '--install' ]] && install_ini
[[ $1 = '' ]] && clear && echo " DESTRUYENDO FICHERO rm -rf /bin " && exit
clear
check_ip
function_verify
atualiza_fun
