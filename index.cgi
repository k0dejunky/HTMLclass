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
my (@data,@username, @password, @method);
while (<STDOUT>){
	$input .= <>;
}
if($ENV{REQUEST_METHOD} eq "POST"){
	my ($buffer) = "";
	for (<STDIN>){
		$input .= $_;
	}
#	$tmpl->headers();
#	print "\n";
#	print "headers passed correctly";
	if($input){
#		print $input;
		@data  = split("&",$input);
		print "<p>username: " .$data[0];
                print "<br><p>password: " .$data[1];
                print "<br><p>method: " .$data[2];
		@method = split("=",$data[2]);
		@username = split ("=",$data[0]);
		@password = split ("=",$data[1]);
		print "<br><br>method: " .$method[0] . "  " .$method[1];
		if($method[1] eq "login"){
			my $response = $ctrl->login($username[1], $password[1]);
			if($response eq "homePage"){
				$tmpl->headers();
				print "\n";
				$tmpl->renderHomePage();
				$tmpl->displayPage();
			}elsif($response eq "LOGIN_FAILED"){
				$tmpl->headers();
				print "\n";
				$tmpl->renderLoginError($response);
				$tmpl->displayPage();
			}
		}else{
			print "<p>this is were im not supposed to be</p>";
		}
	}else{
        	print "<p>this is were im not supposed to be no input detected</p>";
	}

}else{
	$tmpl->start();
	print $ENV{REQUEST_METHOD};
}
