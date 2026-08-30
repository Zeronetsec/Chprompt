#!/usr/bin/env perl
# https://github.com/Zeronetsec/Chprompt

use strict;
use warnings;
use File::Find;
use File::Spec;

sub load_patterns {
    my ($pattern_file_path) = @_;

    if (
        !$pattern_file_path ||
        ! -e $pattern_file_path
    ) {
        my $path_display = $pattern_file_path // "";
        print "\x1b[1;31m[!] \x1b[0mPattern file: \x1b[0;32m${path_display} \x1b[0mnot found!\n";
        exit(1);
    }

    my @compiled_patterns;
    open(
        my $fh,'<:encoding(UTF-8)', $pattern_file_path,
    ) or die "\x1b[1;31m[!] \x1b[0mCannot open pattern file: \x1b[0;32m${!}\x1b[0m\n";

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
        print "\x1b[1;31m[!] \x1b[0mPlugin directory: \x1b[0;32m${dir_display} \x1b[0mnot found!\n";
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
                            print "\x1b[0;32m[+] \x1b[0mFound ${match_count}: \x1b[0;32m${file_path} \x1b[1;90m(\x1b[0;36m${clean_line}\x1b[1;90m)\x1b[0m\n";
                        }
                    }
                    close($fh);
                };
            }, no_chdir => 0
        }, $plugin_dir
    );

    print "\n\x1b[1;34m[*] \x1b[0mTotal: \x1b[0;32m${match_count} \x1b[0mmalicious pattern found!\n";
}

my $PLUGIN_PATH  = $ENV{'plugin'};
my $PATTERN_PATH = $ENV{'pattern'};

if (
    !$PLUGIN_PATH ||
    !$PATTERN_PATH
) {
    print "\x1b[1;31m[!] \x1b[0mMissing variable: \x1b[0;32mplugin \x1b[0mand \x1b[0;32mpattern\x1b[0m\n";
    exit(1);
}

my $keywords = load_patterns($PATTERN_PATH);
scan_plugin($PLUGIN_PATH, $keywords);

# Copyright (c) 2026 Zeronetsec