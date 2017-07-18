#!/usr/bin/perl

#Author: Kodejunky
#Date: July 12, 2017
#File: WebDB

package WebDB;

use DBI;
use strict;
use warnings;

my $filename = "db.conf";
open(my $FH '<' $filename) or die "Could not open file: '$filename' $!";
while (my $row <$FH>){
	chomp $row;
	print $row . "\n";
}


1;
