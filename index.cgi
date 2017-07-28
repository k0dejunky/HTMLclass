#!/usr/bin/perl
#Author: Kodejunky
#Date: July 12, 2017
#File: index.cgi

use strict;
use warnings;

use WebTemplater;
use WebController;
use HTTP::Request::Common qw(POST);
my (@mtd, @uname, @pword);
my @POST;
my $tmpl = WebTemplater->new();
my $ctrl = WebController->new();
my $length = $ENV{CONTENT_LENGTH};
my $input;
my (@username, @password, @method);
if(<STDIN>){
	my ($buffer) = "";
	$input = <>;
	$tmpl->headers();
	 print "\n";
	if($input){
		print $input;
		(@username, @password, @method) = $ctrl->parcePost($input);
		if($method[1] eq "login"){
			my $response = $ctrl->login($username[1], $password[1]);
			if($response eq "homePage"){
				$tmpl->headers();
				$tmpl->renderHomePage();
				$tmpl->displayPage();
			}elsif($response eq "LOGIN_FAILED"){
				$tmpl->headers();
				$tmpl->renderLoginError($response);
				$tmpl->displayPage();
			}
		}
	}
}else{
	$tmpl->start();
	print $ENV{REQUEST_METHOD};
}
