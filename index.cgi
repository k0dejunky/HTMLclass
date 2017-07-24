#!/usr/bin/perl
#Author: Kodejunky
#Date: July 12, 2017
#File: index.cgi

use strict;
use warnings;

use WebViewer;
use WebController;
use HTTP::Request::Common qw(POST);

my @POST;
my $view = WebViewer->new();
my $ctrl = WebController->new();
my $length = $ENV{CONTENT_LENGTH};
my $input;
for(<STDIN>) {
  $input = $input.$_;
}
if ($input){
	$ctrl->login($input);
}else {
	$view->start();
}

sub parsePOST {
	my $input = @_;
	my ($username, $password, $method) = split (/&/);
	if (index($username, "username=")>0){
		my @uname = join('=>', split(/=/, $username));
		print $uname{username};
	}else{
		die "USERNAME NOT PROVIDED";
	}
}
