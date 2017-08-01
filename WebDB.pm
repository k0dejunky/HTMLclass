#!/usr/bin/perl

#Author: Kodejunky
#Date: July 12, 2017
#File: WebDB

package WebDB;

use DBI;
use strict;
use warnings;

my $filename = "db.conf";
my $noDB = 0;
my @tmp;
my $database;
my $user;
my $password;
my $DBH;

sub new {
        my $class = shift;
        my %options = @_;
        my $self = {%options};
        bless($self, $class);
        return($self);
}

sub parseConfig{
	
}

sub connect {
	my ($self) = @_;
	if (-e $filename){
       		#open the file and read into the config array
	        open(my $FH, '<', $filename) or die "Could not open file: '$filename' $!";
        	my $row;
       		while (<$FH>){
			$row = $_;
	                chomp $row;
        	        if(index($row, "database=")>0){
                	        @tmp = split(/=/,$row);
                        	$database = $tmp[1];
	                }elsif(index($row, "password=")>0){
        	                @tmp = split(/=/, $row);
                	        $password = $tmp[1];
	                }elsif(index($row, "username=")>0){
        	                @tmp = split(/=/,$row);
                	        $user = $tmp[1];
	                }       
        	}
	        $self->{driver} = "DBI:mysql:$database;";
        	$DBH = $DBI->connect($driver,$user,$password,{AutoCommit=>1,RaiseError=>1,PrintError=>0}) or die "could not connect to the database: $DBI::errstr";
	}else{
        	die("error no db.conf file");
	}
}

sub insert{
	my ($self, $sql) = @_;
	$self->connect();
	my $STH = $DBH->prepare($sql);
	my $response = $STH->execute();
	if ($response < 0){
		return $DBI::errstr;
	}else{
		return $response;
	}
	
}

sub setSessionID {
	my ($self, $sql) = @_;
	$self->connect();
	my $STH = $DBH->prepare($sql);
	my $response = $STH->execute();
	if ($response < 0){
		return $DBI::errstr;
	}else{
		return $response;
	}
}
1;
