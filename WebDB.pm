#!/usr/bin/perl -w

#Author: Kodejunky
#Date: July 12, 2017
#File: WebDB

package WebDB;

use strict;
use warnings;

use DBI;

my $filename = "minecraftServer.conf";
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
			#print "Content-type: text/html\n\n";
			#print "Database: $database\n";
		}elsif(index($row, "password=")>=0){
			@tmp = split(/=/, $row);
			$password = $tmp[1];
			#print "Content-type: text/html\n\n";
			#print "Password: $password\n";
		}elsif(index($row, "username=")>=0){
			@tmp = split(/=/,$row);
			$user = $tmp[1];
			#print "Content-type: text/html\n\n";
			#print "Username: $user\n";
		}
	}
}else{
	die("error no db.conf file");
}

sub new {
        my $class = shift;
        my %options = @_;
        my $self = {driver=>"DBI:mysql:driver=$database:host=localhost", %options};
        bless($self, $class);
        return($self);
}
sub connect {
	my ($self) = @_;
	my $DBH = DBI->connect("DBI:mysql:database=$database;host=localhost",$user,$password) or die "could not connect to the database: $DBI::errstr";
	return $DBH;
}
sub select {
	my ($self, $sql) = @_;
	my $dbh = $self->connect();
	my $sth = $dbh->prepare($sql) or return $DBI::errstr;
	my $rez = $sth->execute() or return $DBI::errstr;
	my @return;
	while (my $ref = $sth->fetchrow_hashref()){
		push @return, $ref->{id};
		push @return, $ref->{username};
		push @return, $ref->{password};
		push @return, $ref->{isAdmin};
		push @return, $ref->{loggedIN};
	}
	$sth->finish;
	$dbh->disconnect();
	return @return;
}
sub insert {
	my ($self, $sql) = @_;
	my $dbh = $self->connect();
	my $sth = $dbh->prepare($sql) or return $DBI::errstr;
	my $rez = $sth->execute() or return $DBI::errstr;
	$sth->finish;
	$dbh->disconnect();
	return "COMPLETE";
}

sub delete {
	my ($self, $sql) = @_;
	my $dbh = $self->connect();
	my $sth = $dbh->prepare($sql) or return $DBI::errstr;
	my $rez = $sth->execute() or return $DBI::errstr;
	$sth->finish;
	$dbh->disconnect();
}

sub update {
	my ($self, $sql) = @_;
	my $dbh = $self->connect();
	my $sth = $dbh->prepare($sql) or return $DBI::errstr;
	my $rez = $sth->execute() or return $DBI::errstr;
	
}
1;
