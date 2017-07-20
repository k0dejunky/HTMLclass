#!/usr/bin/perl
#Author: Kodejunky
#Date: July 12, 2017

use strict;
use warnings;

use WebViewer;
use WebController;
use HTTP::Request::Common qw(POST);

my $view =  WebViewer->new();
#print "Content-type: text/html\n\n";
#if($ENV{'HTTP_REFERER'}){
#	print $ENV{'HTTP_REFERER'};
#}else{
#	print "filed";
#}
$view->start();

