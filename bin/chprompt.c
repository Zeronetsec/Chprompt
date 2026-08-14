// https://github.com/Zeronetsec/Chprompt

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <limits.h>
#include <libgen.h>

int main(int argc, char *argv[]) {
    char exe_path[PATH_MAX];
    char abs_root[PATH_MAX];

    ssize_t len = readlink(
        "/proc/self/exe",
        exe_path,
        sizeof(exe_path) - 1
    );

    if (len == -1) {
        if (realpath(argv[0], exe_path) == NULL) {
            perror(
                "\x1b[1;31m[!] \x1b[0mError resolving path!"
            );
            return 1;
        }
    } else {
        exe_path[len] = '\0';
    }

    char *dir = dirname(exe_path);
    char root_path[PATH_MAX];
    snprintf(
        root_path,
        sizeof(root_path),
        "%s/..",
        dir
    );

    if (realpath(root_path, abs_root) == NULL) {
        perror(
            "\x1b[1;31m[!] \x1b[0mError resolving root path!"
        );
        return 1;
    }

    if (argc > 1 && strcmp(argv[1], "--init") == 0) {
        char bashrc[PATH_MAX];
        if (argc > 2) {
            strncpy(
                bashrc,
                argv[2],
                sizeof(bashrc) - 1
            );
            bashrc[sizeof(bashrc) - 1] = '\0';
        } else {
            char *home = getenv("HOME");
            if (home == NULL) {
                fprintf(
                    stderr,
                    "\x1b[1;31m[!] \x1b[0mVariable: \x1b[0;32m$HOME \x1b[0mnot found!\n"
                );
                return 1;
            }
            snprintf(
                bashrc,
                sizeof(bashrc),
                "%s/.bashrc",
                home
            );
        }

        FILE *f = fopen(bashrc, "a");
        if (f == NULL) {
            perror(
                "\x1b[1;31m[!] \x1b[0mError opening shell configuration file!"
            );
            return 1;
        }

        if (
            fprintf(
                f,
                "source %s/chprompt.sh", abs_root
            ) < 0
        ) {
            fprintf(
                stderr,
                "\x1b[1;31m[!] \x1b[0mError: failed to write file!\n"
            );
            fclose(f);
            return 1;
        }
        fclose(f);

        printf(
            "\x1b[1;34m[*] \x1b[0mInjected code: \x1b[0;32msource %s/chprompt.sh \x1b[1;90m-> \x1b[0;32m%s\x1b[0m\n",
            abs_root, bashrc
        );
        return 0;
    }

    printf(
        "%s",
        abs_root
    );
    return 0;
}

// Copyright (c) 2026 Zeronetsec