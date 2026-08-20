// https://github.com/Zeronetsec/Chprompt

#ifdef __ANDROID__
    #include <config.h>
#else
    #include <libconfig.h>
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include "builtins.h"
#include "shell.h"
#include "bashgetopt.h"

#define N "\x1b[0m"
#define R "\x1b[1;31m"
#define GG "\x1b[0;32m"

int use_builtin(WORD_LIST *list) {
    if (
        !list ||
        !list->word ||
        !list->word->word
    ) {
        return EXECUTION_FAILURE;
    }

    char *arg1 = list->word->word;
    if (strlen(arg1) == 0) {
        return EXECUTION_FAILURE;
    }

    char *slash = strchr(arg1, '/');
    if (!slash) {
        printf(
            "%s[!] %sInvalid input!\n",
            R, N
        );
        return EXECUTION_FAILURE;
    }

    int folder_len = slash - arg1;
    char *folder = strndup(arg1, folder_len);
    char *file = strdup(slash + 1);

    char *slash2 = strchr(file, '/');
    if (slash2) {
        *slash2 = '\0';
    }

    char *root = get_string_value("root");
    if (!root) root = "";

    char filepath[1024];
    snprintf(
        filepath,
        sizeof(filepath),
        "%s/plugin/%s_line/%s.chp",
        root, folder, file
    );

    if (access(filepath, F_OK) != 0) {
        printf(
            "%s[!] %sPrompt: %s%s/%s %snot found!\n",
            R, N, GG, folder, file, N
        );
        free(folder);
        free(file);
        return EXECUTION_FAILURE;
    }

    FILE *fp = fopen(filepath, "r");
    if (!fp) {
        perror(
            "Failed open file!"
        );
        free(folder);
        free(file);
        return EXECUTION_FAILURE;
    }

    char line[1024];
    char ps1_buffer[4096] = {0};
    size_t ps1_len = 0;
    int in_block = 0;

    while (fgets(line, sizeof(line), fp)) {
        line[strcspn(line, "\r\n")] = 0;
        if (!in_block) {
            if (strcmp(line, "[Execute]") == 0) {
                in_block = 1;
            }
            continue;
        } else {
            if (strcmp(line, "[END]") == 0) {
                break;
            }

            char *p = line;
            while (*p && isspace((unsigned char)*p)) p++;
            if (*p == '\0' || *p == '#') continue; 

            char *src = line;
            while (*src) {
                if (strncmp(src, "%space%", 7) == 0) {
                    if (ps1_len < sizeof(ps1_buffer) - 1) {
                        ps1_buffer[ps1_len++] = ' ';
                    }
                    src += 7;
                } else {
                    if (ps1_len < sizeof(ps1_buffer) - 1) {
                        ps1_buffer[ps1_len++] = *src;
                    }
                    src++;
                }
            }
        }
    }
    fclose(fp);

    SHELL_VAR *var = bind_variable(
        "PS1",
        ps1_buffer,
        0
    );

    if (var) {
        VSETATTR(var, att_exported);
    }

    free(folder);
    free(file);
    return EXECUTION_SUCCESS;
}

char *use_doc[] = {
    "Use prompt.",
    NULL
};

struct builtin use_struct = {
    "use",
    use_builtin,
    BUILTIN_ENABLED,
    use_doc,
    "use <folder>/<file>",
    0
};

// Copyright (c) 2026 Zeronetsec