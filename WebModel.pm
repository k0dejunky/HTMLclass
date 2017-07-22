#!/usr/bin/perl
#Author: Kodejunky
#Date: July 12, 2017
#File: WebPageModel.pm

package WebModel;

use strict;
use warnings;

#use WebPageController;
use DBI;

if (-e "db.conf"){
        #open the file and read into the config array
}else{
        die("error no db.conf file");
}

#my $ctrl = WebPageController->new();

sub new {
        my $class = shift;
        my %options = @_;
        my $self = {%options};
        bless($self, $class);
        return($self);

}

sub login {
	my ($self, $user, $pass) = @_;
	my $response = ""; # the response will be the sql return from DBI for the authentication of user login.
	return $response;
}

sub restartServer {

}

sub stopServer {

}

sub startServer {


}

sub firstStart {

}

sub reset {

}


1;
