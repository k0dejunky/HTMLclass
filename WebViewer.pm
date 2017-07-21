#!/usr/bin/perl

#Author K0dejunky
#Date July 7, 2017
#Version 1.0

package WebViewer;

use GUI;
use WebController;
use strict;
use warnings;

my $GUI = GUI->new();

sub new{
	my $class = shift;
	my %options = @_;
	my $self = {output => "", mode => "", %options};
	bless($self, $class);
	return($self);
}

sub start {
	my ($self) = @_;
	print $GUI->headers();
	print $GUI->startPage("Minecraft Server Admin");
	$self->{output} = $self->{output}.$GUI->divStart("main");
	$self->{output} = $self->{output}.$GUI->divStart("headbox");
        $self->{output} = $self->{output}.$GUI->divStart("header");
	$self->{output} = $self->{output}.$GUI->h1("center", "Minecraft Server Admin Page");
        $self->{output} = $self->{output}.$GUI->divEnd();
	$self->{output} = $self->{output}.$GUI->br();
	$self->renderLogin();
	$self->{output} = $self->{output}.$GUI->divEnd();
        $self->{output} = $self->{output}.$GUI->divEnd();
	$self->displayPage();
}
sub renderLogin {
	my ($self) = @_;
#	$self->{output} = $self->{output}.$GUI->divStart("logon", "center");
	$self->{output} = $self->{output}.$GUI->divStart("logon1", "vertCenter");
        $self->{output} = $self->{output}.$GUI->h1("center", "Log in below");
        $self->{output} = $self->{output}.$GUI->br();
	$self->{output} = $self->{output}.$GUI->formStart("center","index.cgi", "post", "login");
	$self->{output} = $self->{output}.$GUI->input("username", "text", "username", "20", "20");
	$self->{output} = $self->{output}.$GUI->br();
	$self->{output} = $self->{output}.$GUI->input("pword", "password", "pword", "20", "20");
	$self->{output} = $self->{output}.$GUI->br();
	$self->{output} = $self->{output}.$GUI->input("submit", "submit","login");
	$self->{output} = $self->{output}.$GUI->formEnd();
	$self->{output} = $self->{output}.$GUI->divEnd();
 #       $self->{output} = $self->{output}.$GUI->divEnd();
}
sub displayPage{
	my ($self) = @_;
	print $self->{output};
}
1;
