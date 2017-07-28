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
	for(<STDIN>) {
		$input = $input.$_;
	}
	if($input){
		(@username, @password, @method) = $ctrl->parcePost($input);
		if($method[1] eq "login"){
			my $response = $ctrl->login($username[1], $password[1]));
			if($response eq "homePage"){
				$tmpl->renderHomePage();
			}elsif($response eq "FAILED"){
				$tmpl->renderLoginFailed();
			}
		}
	}
}else{
	$tmpl->start();

}
