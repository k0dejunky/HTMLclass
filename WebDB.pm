#!/usr/bin/perl -w

#Author: Kodejunky
#Date: July 12, 2017
#File: WebDB

package WebDB;

use strict;
use warnings;

use DBI;

my $filename = "db.conf";
my $noDB = 0;
my @tmp;
my $database;
my $user;
my $password;
#my $DBH;
if (-e $filename){
	#open the file and read into the config array
	open(my $FH, '<', $filename) or die "Could not open file: '$filename' $!";
	while(my $row = <$FH>){
		chomp $row;
		if(index($row, "database=")>=0){
			@tmp = split(/=/,$row);
			$database = $tmp[1];
			print $database;
		}elsif(index($row, "password=")>=0){
			@tmp = split(/=/, $row);
			$password = $tmp[1];
			print $password;
		}elsif(index($row, "username=")>=0){
			@tmp = split(/=/,$row);
			$user = $tmp[1];
			print $user;
		}
	}
}else{
	die("error no db.conf file");
}
my $DBH = DBI->connect("DBI:mysql:driver=$database;host=localhost",$user,$password) or die "could not connect to the database: $DBI::errstr";

sub new {
        my $class = shift;
        my %options = @_;
        my $self = {driver=>"DBI:mysql:driver=$database:host=localhost", %options};
        bless($self, $class);
        return($self);
}
1;
