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
if ($ENV{CONTENT_LENGTH}){
	my $length = $ENV{CONTENT_LENGTH};
}else{
	my $length;
}
my $input;
my (@username, @password, @method);
if(<STDIN>){
	my ($buffer) = "";
	read(<STDIN>, $buffer, $length);
	if(length($buffer)>0){
		(@username, @password, @method) = $ctrl->parcePost($input);
		if($method[1] eq "login"){
			my $response = $ctrl->login($username[1], $password[1]);
			if($response eq "homePage"){
				$tmpl->renderHomePage();
			}elsif($response eq "FAILED"){
				$tmpl->renderLoginFailed();
			}
		}
	}
}else{
	$tmpl->start();
	print $ENV{REQUEST_METHOD};
}
