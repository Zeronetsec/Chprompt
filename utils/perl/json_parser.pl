#!/usr/bin/env perl
# https://github.com/Zeronetsec/Chprompt

use strict;
use warnings;
use File::Spec;
use JSON::PP;

my $target_metadata = $ENV{'root'};
if (!$target_metadata) {
    print "\x1b[1;31m[!] \x1b[0mVariable: \x1b[0;32mroot \x1b[0mnot found!\n";
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
            $fullcmd = "\x1b[0;32m${command} \x1b[0;36m${args}\x1b[0m";
        } else {
            $fullcmd = "\x1b[0;32m${command}\x1b[0m";
        }

        print "    \x1b[1;90m* ${fullcmd}\n";
        print "    \x1b[1;90m└── \x1b[0;37m${desc}\x1b[0m\n";
    };

    if ($@) {
        next;
    }
}

# Copyright (c) 2026 Zeronetsec