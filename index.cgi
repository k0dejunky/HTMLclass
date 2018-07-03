#!/usr/bin/perl -WT

#Author: K0dejunky
#Date: July 12, 2017
#File: index.cgi
#Description: This is the main view. The page will be sent here when it is ready to be displayed. 

use lib "/usr/lib/cgi-bin/";
use strict;
use warnings;

#use 5.22.1;

use WebTemplater;
use WebController;
use IO::Handle;
use Data::Dumper;

#env config settings:
my $OS = $^O; #detect OS
$|=1; #output buffer flushing enabled, set to 0 to disable


my $ctrl = new WebController;
my $tmpl = new WebTemplater;

my $length = $ENV{CONTENT_LENGTH};
my $input;
my @data;
my @username;
my @password;
my @method;
my $mem = {CONTENT_LENGTH => 0, METHOD => "", APP_HEADER => "Content-Type: application/x-www-form-urlencoded\n", HTMLHEADER => "Content-type: text/html\n\n",COOKIEHEADER => "", };
my $sessionValid;
my $sessionID = $ctrl->getCookie('MinecraftServerBlog');
print "Content-type: text/html\n\n";
if($sessionID){
	$sessionValid = $ctrl->validateCookie($sessionID);
       if($sessionValid->{sessionID} =~/$sessionID/){
               #stuff goes here if nothing was posted like check for existing cookie and load the homePage or load the start page.
               print $mem->{HTMLHEADER};
               print $ctrl->renderHomePage($sessionValid);
	}
}else{
	if($ENV{REQUEST_METHOD} =~ /POST/){
		if($mem->{CONTENT_LENGTH} != $ENV{CONTENT_LENGTH}){
 			for (<STDIN>){
         			$input .= $_;
				#$mem->{CONTENT_LENGTH} = $length;
		 	}
       			if($input){
       	        		@data  = split("&",$input);
				if (scalar @data == 3){
					@method = split("=",$data[2]);
	        	       		@username = split ("=",$data[0]);
        	        		@password = split ("=",$data[1]);
				}
					
				if(@username && @password){
	       	        		if($method[1] =~ /login/){
	               		        	my $response = $ctrl->login($username[1], $password[1]);
						if($response->{cookie} && $response->{info}){
							print $response->{cookie};
							print $mem->{HTMLHEADER};
							if($response->{info}{isAdmin} == 1){
								print $ctrl->renderAdminPage($response->{info});
							}else{
								print $ctrl->renderHomePage($response->{info});
							}
						}elsif($response->{error}){
							print $mem->{HTMLHEADER};
							print $response->{error};
						}
					}elsif($method[1] =~ /rebootServer/){
        	        	        	my @response = $ctrl->rebootServer();
	                	        	if(@response){
						    print $response[0];
						    print $mem->{HTMLHEADER};
                    			            #print $tmpl->renderServerRebooted();
						    print $response[1];
	                        		}
		                	}
        			}else{
					print $mem->{HTMLHEADER};
					print Dumper %ENV;
					print $tmpl->renderLoginErrorPage("Username or Password Not Entered");
		        	}
			}else{
				print $mem->{HTMLHEADER};
				print Dumper %ENV;
	       			print $ctrl->start();
			}
		}
	}elsif($ENV{REQUEST_METHOD} =~ /GET/){
		if($ENV{QUERY_STRING}){
			print $mem->{HTMLHEADER};
			print Dumper  %ENV;
			print $ctrl->renderHomePage();
		}else{
			print $mem->{HTMLHEADER};
			print $ctrl->start();
		}			
	}else{
		print $mem->{APP_HEADER};
		print $mem->{HTMLHEADER};
		print $ctrl->start();
	}
}
