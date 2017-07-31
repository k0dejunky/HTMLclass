#!/usr/bin/perl

#Author: Kodejunky
#Date: July 12, 2017
#File: WebDB

package WebDB;

use DBI;
use strict;
use warnings;

#my $db = DBI->

my $filename = "db.conf";
if (-e $filename){
        #open the file and read into the config array
	open(my $FH, '<', $filename) or die "Could not open file: '$filename' $!";
	my $row;
	while (<$FH>){
		$row = $_;
        	chomp $row;
        	#print $row . "\n";
	}
}else{
        die("error no db.conf file");
}
sub connect {
	
}
1;
