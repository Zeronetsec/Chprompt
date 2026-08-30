#!/usr/bin/env perl
# https://github.com/Zeronetsec/Chprompt

use strict;
use warnings;
use Time::HiRes qw(sleep time);

sub uwu {
    $| = 1;
    my @faces = (
        "(｡◕‿◕｡)",
        "(≧◡≦)",
        "ʕ•ᴥ•ʔ",
        "(・ω・)",
        "(๑˃ᴗ˂)ﻭ",
        "(ง'̀-'́)ง",
        "(=^･ω･^=)"
    );

    my $delay = 0.2;
    my $duration = 5;
    my $start_time = time();

    print "\x1b[?25l";

    while ((time() - $start_time) < $duration) {
        foreach my $face (@faces) {
            last if (
                time() - $start_time
            ) >= $duration;
            print "\r${face}\x1b[K";
            sleep($delay);
        }
    }

    print "\x1b[?25h\n";
}

uwu();

# Copyright (c) 2026 Zeronetsec