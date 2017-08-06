#!/usr/bin/perl
#Author: Kodejunky
#Date: July 12, 2017
#File: index.cgi

use strict;
use warnings;

use WebTemplater;
use WebController;
use HTTP::Request::Common qw(POST);
my $tmpl = WebTemplater->new();
my $ctrl = WebController->new();
my $length = $ENV{CONTENT_LENGTH};
my $input;
my @data;
my @username;
my @password;
my @method;
if($ENV{REQUEST_METHOD} eq "POST"){
	for (<>){
		$input .= $_;
	}
	if($input){
		@data  = split("&",$input);
		@method = split("=",$data[2]);
		@username = split ("=",$data[0]);
		@password = split ("=",$data[1]);
		if($method[1] eq 'login'){
			my $response = $ctrl->login($username[1], $password[1]);
			if($response eq "homePage"){	
				$tmpl->renderHomePage();
			}elsif($response eq "LOGIN_FAILED"){
				$tmpl->renderLoginErrorPage($response);
			}else{
			}
		}else{
		}
	}else{
	}

}else{
	$tmpl->start();
	print $ENV{REQUEST_METHOD};
}
