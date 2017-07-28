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
my (@username, @password, @method);
if(<STDIN>){
	for(<STDIN>) {
		$input = $input.$_;
	}
	if($input){
		(@username, @password, @method) = $ctrl->parcePost($input);
		if($method[1] eq "login"){
			$view->drawPage($ctrl->login($username[1], $password[1]), $ctrl->{cookie});
		}
	}
}else{
	$view->start();

}
