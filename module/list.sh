# https://github.com/Zeronetsec/Chprompt

function module::List() {
    local path="${root}/plugin"

    local l1="$(command ls "${path}/1_line/" | command wc -l)"
    local l2="$(command ls "${path}/2_line/" | command wc -l)"
    local l3="$(command ls "${path}/3_line/" | command wc -l)"
    local l4="$(command ls "${path}/4_line/" | command wc -l)"
    local l5="$(command ls "${path}/5_line/" | command wc -l)"
    local l6="$(command ls "${path}/6_line/" | command wc -l)"

    echo -e "${color_N}List available prompts:"
    echo -e "    ${color_DG}* ${color_GG}1${color_DG}/${color_GG}1-${l1}${color_N}"
    echo -e "    ${color_DG}* ${color_GG}2${color_DG}/${color_GG}1-${l2}${color_N}"
    echo -e "    ${color_DG}* ${color_GG}3${color_DG}/${color_GG}1-${l3}${color_N}"
    echo -e "    ${color_DG}* ${color_GG}4${color_GG}/${color_GG}1-${l4}${color_N}"
    echo -e "    ${color_DG}* ${color_GG}5${color_DG}/${color_GG}1-${l5}${color_N}"
    echo -e "    ${color_DG}* ${color_GG}6${color_DG}/${color_GG}1-${l6}${color_N}"

    return 0
}

# Copyright (c) 2026 Zeronetsec