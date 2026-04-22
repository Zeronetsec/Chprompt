# https://github.com/Zeronetsec/Chprompt

function list() {
    local path="${chppath}/plugin"

    local l1="$(command ls "${path}/1_line/" | command wc -l)"
    local l2="$(command ls "${path}/2_line/" | command wc -l)"
    local l3="$(command ls "${path}/3_line/" | command wc -l)"
    local l4="$(command ls "${path}/4_line/" | command wc -l)"
    local l5="$(command ls "${path}/5_line/" | command wc -l)"
    local l6="$(command ls "${path}/6_line/" | command wc -l)"

    echo -e "${N}List available prompts:"
    echo -e "    ${DG}* ${GG}1${DG}/${GG}1-${l1}${N}"
    echo -e "    ${DG}* ${GG}2${DG}/${GG}1-${l2}${N}"
    echo -e "    ${DG}* ${GG}3${DG}/${GG}1-${l3}${N}"
    echo -e "    ${DG}* ${GG}4${GG}/${GG}1-${l4}${N}"
    echo -e "    ${DG}* ${GG}5${DG}/${GG}1-${l5}${N}"
    echo -e "    ${DG}* ${GG}6${DG}/${GG}1-${l6}${N}"

    return $?
}

# Copyright (c) 2026 Zeronetsec