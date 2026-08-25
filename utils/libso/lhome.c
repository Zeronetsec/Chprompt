// https://github.com/Zeronetsec/Chprompt

#ifdef __ANDROID__
    #include <config.h>
#else
    #include <libconfig.h>
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>
#include <sys/stat.h>
#include <builtins.h>
#include <shell.h>

#define R "\x1b[1;31m"
#define GG "\x1b[0;32m"
#define N "\x1b[0m"

static int do_fallback(
    const char *config_file,
    const char *home
) {
    char fallback_path[1024];
    snprintf(
        fallback_path,
        sizeof(fallback_path),
        "%s/.bashrc",
        home
    );

    printf(
        "%s[!] %sFallback to: %s%s%s\n",
        R, N, GG, fallback_path, N
    );

    FILE *f = fopen(config_file, "w");
    if (f) {
        fprintf(
            f,
            "%s",
            fallback_path
        );
        fclose(f);
    }

    bind_variable(
        "lhome",
        fallback_path,
        0
    );

    return EXECUTION_FAILURE;
}

int lhome_builtin(WORD_LIST *list) {
    char *root = get_string_value("root");
    char *home = get_string_value("HOME");

    if (!root) root = "/usr/opt/chprompt";
    if (!home) home = "/root";

    char config_file[1024];
    snprintf(
        config_file,
        sizeof(config_file),
        "%s/config/chprompt_bashrc.txt",
        root
    );

    if (access(config_file, F_OK) != 0) {
        printf(
            "%s[!] %sFile: %s%s %snot found!\n",
            R, N, GG, config_file, N
        );
        return EXECUTION_FAILURE;
    }

    FILE *f = fopen(config_file, "r");
    if (!f) return EXECUTION_FAILURE;

    char *line = NULL;
    size_t len = 0;
    ssize_t read;
    char raw_line[1024] = {0};
    int found = 0;

    while ((read = getline(&line, &len, f)) != -1) {
        char *p = line;
        while (*p && isspace(*p)) p++;
        if (
            *p == '\0' ||
            *p == '#'
        ) continue;

        char *newline = strpbrk(
            p,
            "\r\n"
        );
        if (newline) *newline = '\0';

        strncpy(
            raw_line,
            p,
            sizeof(raw_line) - 1
        );

        found = 1;
        break;
    }

    free(line);
    fclose(f);

    if (!found || strlen(raw_line) == 0) {
        printf(
            "%s[!] %sBashrc not set!\n",
            R, N
        );
        return do_fallback(config_file, home);
    }

    char expanded_lhome[1024];
    if (raw_line[0] == '~') {
        snprintf(
            expanded_lhome,
            sizeof(expanded_lhome),
            "%s%s",
            home,
            raw_line + 1
        );
    } else {
        strncpy(
            expanded_lhome,
            raw_line,
            sizeof(expanded_lhome) - 1
        );
    }

    bind_variable(
        "lhome",
        expanded_lhome,
        0
    );

    if (access(expanded_lhome, F_OK) != 0) {
        printf(
            "%s[!] %sBashrc: %s%s %snot found!\n",
            R, N, GG, expanded_lhome, N
        );
        return do_fallback(config_file, home);
    }

    return EXECUTION_SUCCESS;
}

char *lhome_doc[] = {
    "Set lhome variable.",
    (char *)NULL
};

struct builtin lhome_struct = {
    "lhome",
    lhome_builtin,
    BUILTIN_ENABLED,
    lhome_doc,
    "lhome",
    0
};

// Copyright (c) 2026 Zeronetsec