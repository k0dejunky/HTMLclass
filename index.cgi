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
#	foreach my $key (keys %ENV) {
  #		print "<LI>$key = $ENV{$key}\n";
  	#}
	#print "</UL>\n";
	for (<>){
		$input .= $_;
	}
	if($input){
	#	print "<p>".$input."</p>";
		@data  = split("&",$input);
		@method = split("=",$data[2]);
	#	print "<p>".$method[0]." ".$method[1]."</p>";
		@username = split ("=",$data[0]);
	#	print "<p>". $username[0]." ". $username[1]."</p>";
		@password = split ("=",$data[1]);
	#	print "<p>". $password[0]." ". $password[1]."</p>";
		if($method[1] eq 'login'){
	#		print "<p>Method submited: ".$method[1]."</p>";
			my $response = $ctrl->login($username[1], $password[1]);
	#		print "<p>".$response."</p>";
			if($response eq "homePage"){	
				#$tmpl->headersCookie($ctrl->setCookie);
				$tmpl->renderHomePage();
         #                       print "<br/><p> LOGIN INFO: ".$input."</p>";
			}elsif($response eq "LOGIN_FAILED"){
				$tmpl->renderLoginErrorPage($response);
          #                      print "<br/><p> LOGIN FAILED INFO: ".$input."</p>";
			}else{
	#			print "<p> this is where i shouldnt be and i don't know why</p>";
			}
		}else{
	#		print "<p>this is were im not supposed to be</p>";
		}
	}else{
        #	print "<p>this is were im not supposed to be no input detected</p>";
	}

}else{
	$tmpl->start();
	print $ENV{REQUEST_METHOD};
}
