#!/usr/bin/perl -w

#  Selftest for The XML Translation Tools 
#
#  Copyright (C) 2000 Free Software Foundation.
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 of the
#  License, or (at your option) any later version.
#
#  This script is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this library; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
#  Author(s): Kenneth Christiansen

## Release information
my $PROGRAM  = "selftest";
my $VERSION  = "0.1";
my $result;
my $case;

## Loaded modules
use strict;

## Always print as the first thing
$| = 1;

my $failed = 0;

my $srcdir = $ENV{"srcdir"} or ".";

sub check_result($)
{
    my $testcase = $_[0];
    my $result =`diff -Nup $srcdir/results/$testcase.h $srcdir/cases/$testcase.h`;
    
    if ($? == 0 && $result eq "") { 
	print "[OK]\n"; ## diff was empty, ie. files were equal
    } else { 
	print "[FAILED]\n"; 
	$failed = 1;
    }
}

sub check_result_output($)
{
    my $testcase = $_[0];
    $testcase =~ s/\.in//;
    my $result =`diff -Nup $srcdir/results/$testcase $srcdir/cases/$testcase`;

    if ($? == 0 && $result eq "") {
        print "[OK]\n"; ## diff was empty, ie. files were equal
    } else {
        print "[FAILED]\n";
        open OUT, ">>errors";
        print OUT $result;
        close OUT;
	$failed = 1;
    }
}


## SELFTESTS

## Welcome notice

print "Running selftest of the xml-i18n-tools module...\n\n";
unlink "errors";

## 1. Extract/Simple desktop file

print "1. Checking output from simple desktop file:                  ";

$case = "extract1.desktop";
system("/usr/bin/perl ../xml-i18n-extract --type=gettext/ini --quiet --update $srcdir/cases/$case") == 0 or $failed = 1;
check_result($case);

## 2. Extract/Simple desktop-like file

print "2. Checking output from simple desktop-like file:             ";

$case = "extract2.keyprop";
system("/usr/bin/perl ../xml-i18n-extract --type=gettext/ini --quiet --update $srcdir/cases/$case") == 0 or $failed = 1;
check_result($case);

## 3. Extract/Simple desktop-like file

print "3. Checking output from simple xml-file:                      ";

$case = "merge1.xml";
system("/usr/bin/perl ../xml-i18n-merge -o --quiet $srcdir/cases $srcdir/cases/$case.in $srcdir/cases/$case") == 0 or $failed = 1;
check_result_output($case);

print "4. Checking output from simple xml-file:                      ";

$case = "extract3.xml.in";
system("/usr/bin/perl ../xml-i18n-extract --type=gettext/xml --quiet --update $srcdir/cases/$case") == 0 or $failed = 1;
check_result($case);

exit $failed;

