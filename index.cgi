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
my (@data, @username, @password, @method);
if($ENV{REQUEST_METHOD} eq "POST"){
	print $tmpl->headers();
	for (<>){
		$input .= $_;
	}
	if($input){
		print "<p>".$input."</p>";
		@data  = split("&",$input);
		@method = split("=",$data[2]);
		print "<p>".$method[0]." ".$method[1]."</p>";
		@username = split ("=",$data[0]);
		print "<p>". $username[0]." ". $username[1]."</p>";
		@password = split ("=",$data[1]);
		print "<p>". $password[0]." ". $password[1]."</p>";
		if($method[1] eq 'login'){
			my $response = $ctrl->login($username[1], $password[1]);
			print "<p>".$response."</p>";
			if($response eq "homePage"){	
				$tmpl->headersCookie($ctrl->setCookie);
	                        print "<br/><p> LOGIN INFO: ".$input."</p>";
				$tmpl->renderHomePage();
				$tmpl->displayPage();
			}elsif($response eq "LOGIN_FAILED"){
				$tmpl->headers();
	                        print "<br/><p> LOGIN FAILED INFO: ".$input."</p>";
				$tmpl->renderLoginErrorPage("Login Failed Try Again");
				$tmpl->displayPage();
			}else{
				print "<p> this is where i shouldnt be and i don't know why</p>";
			}
		}else{
			print "<p>this is were im not supposed to be</p>";
		}
	}else{
        	print "<p>this is were im not supposed to be no input detected</p>";
	}

}else{
	$tmpl->start();
#	print $ENV{REQUEST_METHOD};
}
