#!/usr/bin/perl
#Author: Kodejunky
#Date: July 12, 2017
#File: index.cgi

use strict;
use warnings;

use WebViewer;
use WebController;
use HTTP::Request::Common qw(POST);
my (@mtd, @uname, @pword);
my @POST;
my $view = WebViewer->new();
my $ctrl = WebController->new();
my $length = $ENV{CONTENT_LENGTH};
my $input;
if(<STDIN>){
	for(<STDIN>) {
		$input = $input.$_;
	}
	if($input){
		$ctrl->processRequest($input);
	}
}else{
	$view->start();
}

sub processRequest {
	my ($ctrl, $index) = @_;
	my ($username, $password, $method) = split(/&/,$index);
	if (index($username, "username=")>0){
		@uname = split(/=/, $username);
		#rint $uname{1};
	}else{
		$view->renderLoginError("NoAuthDetails");
	}
	if (index($password, "pword")>0){
		@pword = split(/=/, $password);
	}else{
		$view->renderLoginError("NoAuthDetails");
	}
	if (index($method, "submit=")>0){
		@mtd =  split(/=/, $method);
		if ($mtd[1] eq "login"){
			my $resp = $ctrl->login($uname[1],$pword[1]);
			if ($resp == 0){
				$view->homePage();
			}else {
				$view->renderLoginError("Invalid Credentials");
			}
		}

	}	
}
