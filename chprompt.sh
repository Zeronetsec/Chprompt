# https://github.com/Zeronetsec/Chprompt

function chprompt() {
    export root="$(command chprompt 2>/dev/null)"
    export lhome=""

    local excode=0
    if [[ -z "${root}" ]]; then
        echo -e "\x1b[1;31m[!] \x1b[0mChprompt path not found!"
        excode=1
    else
        source "${root}/utils/include.sh"
        include : '(
            utils/color
            utils/lhome
            utils/getblock
            utils/missing_argument
            utils/invalid_option
            utils/destroyv
            utils/destroyf
            utils/birthday
            utils/cprompt
            utils/banner
            module/helper
            module/uwu
            module/version
            module/list
            module/preview
            module/inject
            module/use
            module/chuser
            module/chhost
            module/reset
            module/audit
            module/current_prompt
            module/show_ps1
            module/show_source
            module/init
            module/chbashrc
        )' || excode=1

        utils::lhome || excode=1

        case "${1}" in
            "")
                utils::missingArgument
                excode=${?}
                ;;
            "--list")
                module::List
                excode=${?}
                ;;
            "--preview")
                module::Preview "${@:2}"
                excode=${?}
                ;;
            "--use")
                module::Use "${@:2}"
                excode=${?}
                ;;
            "--inject")
                module::Inject "${@:2}"
                excode=${?}
                ;;
            "--chuser")
                module::Chuser "${@:2}"
                excode=${?}
                ;;
            "--chhost")
                module::Chhost "${@:2}"
                excode=${?}
                ;;
            "--reset")
                module::Reset
                excode=${?}
                ;;
            "--audit")
                module::Audit
                excode=${?}
                ;;
            "--current-prompt")
                module::CurrentPrompt
                excode=${?}
                ;;
            "--show-ps1")
                module::ShowPS1 "${@:2}"
                excode=${?}
                ;;
            "--show-source")
                module::ShowSource "${@:2}"
                excode=${?}
                ;;
            "--init")
                module::Init "${@:2}"
                excode=${?}
                ;;
            "--chbashrc")
                module::Chbashrc "${@:2}"
                excode=${?}
                ;;
            "--uwu")
                module::Uwu
                excode=${?}
                ;;
            "--version")
                module::Version
                excode=${?}
                ;;
            "--help")
                module::Helper
                excode=${?}
                ;;
            *)
                utils::invalidOption "${1}"
                excode=${?}
                ;;
        esac
    fi

    destroyv : '(
        N
        R
        B
        DG
        GG
        BB
        CC
        WW
        root
        plugin
        pattern
        lhome
    )' || excode=1

    destroyf : '(
        utils::lhome
        utils::getblock
        utils::missingArgument
        utils::invalidOption
        utils::birthday
        utils::cprompt
        utils::banner
        module::Helper
        module::Uwu
        module::Version
        module::List
        module::Preview
        module::Inject
        module::Use
        module::Chuser
        module::Chhost
        module::Reset
        module::Audit
        module::CurrentPrompt
        module::ShowPS1
        module::ShowSource
        module::Init
        module::Chbashrc
    )' || excode=1

    unset -f include
    unset -f destroyv
    unset -f destroyf

    return ${excode}
}

# Copyright (c) 2026 Zeronetsec