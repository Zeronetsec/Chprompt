#!/usr/bin/env perl
# https://github.com/Zeronetsec/Chprompt

use strict;
use warnings;
use File::Spec;
use JSON::PP;

my $N = "\x1b[0m";
my $R = "\x1b[1;31m";
my $GG = "\x1b[0;32m";
my $CC = "\x1b[0;36m";
my $DG = "\x1b[1;90m";
my $WW = "\x1b[0;37m";

my $target_metadata = $ENV{'root'};
if (!$target_metadata) {
    print "${R}[!] ${N}Variable: ${GG}root ${N}not found!\n";
    exit(1);
}

my $metadata_path = File::Spec->catfile(
    $target_metadata, "metadata", "*.json"
);

for my $file_path (glob($metadata_path)) {
    eval {
        open(
            my $fh, '<:encoding(UTF-8)', $file_path
        ) or die $!;

        local $/;
        my $json_text = <$fh>;
        close($fh);

        my $data = decode_json($json_text);

        my $command = $data->{Command} // "";
        my $args = $data->{Args} // "";
        my $desc = $data->{Description} // "";

        my $fullcmd;
        if ($args ne "") {
            $fullcmd = "${GG}${command} ${CC}${args}${N}";
        } else {
            $fullcmd = "${GG}${command}${N}";
        }

        print "    ${DG}* ${fullcmd}\n";
        print "    ${DG}└── ${WW}${desc}${N}\n";
    };

    if ($@) {
        next;
    }
}

# Copyright (c) 2026 Zeronetsec