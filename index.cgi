#!/usr/bin/perl

use strict;
use warnings;
use WebTemplater;
use WebController;
use IO::Handle;
use Data::Dumper;

my $ctrl = new WebController;
my $tmpl = new WebTemplater;

my $length = $ENV{CONTENT_LENGTH};
my $input;
my @data;
my @username;
my @password;
my @method;
my $mem = {CONTENT_LENGTH => 0, METHOD => ""};

if($ENV{REQUEST_METHOD} eq "POST"){
	if($mem->{CONTENT_LENGTH} != $ENV{CONTENT_LENGTH}){

        	for (<STDIN>){
                	$input .= $_;
			$mem->{CONTENT_LENGTH} = $length;
			$|=1;
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
					#print "Content-type text/html\n\n";
					#print "<h1> test </h1>";
	                        }elsif($response eq "LOGIN_FAILED"){
        	                        $tmpl->renderLoginErrorPage($response);
                	        }elsif($response eq "NO_RESPONSE_TRY_AGAIN"){
					$tmpl->renderLoginErrorPage($response);
				}elsif($response eq "adminAccount"){
					$tmpl->renderAdminPage();
				}else{
					print "Content-type: text/html\n\n";
					print "<h1> Something went wrong!!!</h1>\n";
				}
        	        }elsif($method[1] eq 'rebootServer'){
                	        my $response = $ctrl->rebootServer();
                        	if($response == 0){
                    	            $tmpl->renderServerRebooted();
                        	}
                	}
        	}else{
			$tmpl->renderHomePage();
        	}
	}

}else{
       	$tmpl->start();

}
