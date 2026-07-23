#!/usr/bin/env perl
# https://github.com/Zeronetsec/Chprompt

use strict;
use warnings;
use File::Find;
use File::Spec;

my $N = "\x1b[0m";
my $R = "\x1b[1;31m";
my $B = "\x1b[1;34m";
my $GG = "\x1b[0;32m";
my $DG = "\x1b[1;90m";
my $CC = "\x1b[0;36m";

sub load_patterns {
    my ($pattern_file_path) = @_;

    if (
        !$pattern_file_path ||
        ! -e $pattern_file_path
    ) {
        my $path_display = $pattern_file_path // "";
        print "${R}[!] ${N}Pattern file: ${GG}${path_display} ${N}not found!\n";
        exit(1);
    }

    my @compiled_patterns;
    open(
        my $fh,'<:encoding(UTF-8)', $pattern_file_path,
    ) or die "${R}[!] ${N}Cannot open pattern file: $!\n";

    while (my $line = <$fh>) {
        $line =~ s/^\s+|\s+$//g;
        next if (
            $line eq '' ||
            $line =~ /^#/
        );

        my $escaped = quotemeta($line);
        my $first_char = substr($line, 0, 1);
        my $last_char = substr($line, -1);

        my $prefix = (
            $first_char =~ /^[a-zA-Z0-9]$/,
        ) ? '\b' : '';

        my $suffix = (
            $last_char =~ /^[a-zA-Z0-9]$/,
        ) ? '\b' : '';

        my $pattern_regex = "${prefix}${escaped}${suffix}";
        push @compiled_patterns, qr/$pattern_regex/;
    }

    close($fh);
    return \@compiled_patterns;
}

sub scan_plugin {
    my ($plugin_dir, $patterns_ref) = @_;
    my @patterns = @$patterns_ref;

    if (
        !$plugin_dir ||
        ! -d $plugin_dir
    ) {
        my $dir_display = $plugin_dir // "";
        print "${R}[!] ${N}Plugin directory: ${GG}${dir_display} ${N}not found!\n";
        exit(1);
    }

    my $match_count = 0;
    find(
        {
            wanted => sub {
                return unless -f $_;
                my $file_path = $File::Find::name;
                eval {
                    open(
                        my $fh, '<:encoding(UTF-8)', $_
                    ) or return;

                    my $line_num = 0;
                    while (my $line = <$fh>) {
                        $line_num++;

                        my $matched = 0;
                        foreach my $pat (@patterns) {
                            if ($line =~ $pat) {
                                $matched = 1;
                                last;
                            }
                        }

                        if ($matched) {
                            $match_count++;
                            my $clean_line = $line;
                            $clean_line =~ s/^\s+|\s+$//g;
                            print "${GG}[+] ${N}Found ${match_count}: ${GG}${file_path} ${DG}(${CC}${clean_line}${DG})${N}\n";
                        }
                    }
                    close($fh);
                };
            }, no_chdir => 0
        }, $plugin_dir
    );

    print "\n${B}[*] ${N}Total: ${GG}${match_count} ${N}malicious pattern found\n";
}

my $PLUGIN_PATH  = $ENV{'plugin'};
my $PATTERN_PATH = $ENV{'pattern'};

if (
    !$PLUGIN_PATH ||
    !$PATTERN_PATH
) {
    print "${R}[!] ${N}Missing variable: ${GG}plugin ${N}and ${GG}pattern${N}\n";
    exit(1);
}

my $keywords = load_patterns($PATTERN_PATH);
scan_plugin($PLUGIN_PATH, $keywords);

# Copyright (c) 2026 Zeronetsec