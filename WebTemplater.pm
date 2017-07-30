#!/usr/bin/perl

#Author K0dejunky
#Date July 7, 2017
#Version 1.0

package WebTemplater;

use GUI;
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
	$self->headers();
	print "Set-Cookie: name=theshityo; path=/cgi-bin/;\n\n";
	print $GUI->startPage("Minecraft Server Admin");
	$self->{output} .= $GUI->divStart("main");
	$self->{output} .= $GUI->divStart("headbox");
        $self->{output} .= $GUI->divStart("header");
	$self->{output} .= $GUI->h1("center", "Minecraft Server Admin Page");
        $self->{output} .= $GUI->divEnd();
	$self->{output} .= $GUI->br();
	$self->renderLogin();
	$self->{output} .= $GUI->divEnd();
        $self->{output} .= $GUI->divEnd();
	$self->displayPage();
}
sub headers {
	my ($self) = @_;
	print $GUI->headers();
}
sub startPage{
	my ($self) = @_;
	$self->{output} .= $GUI->startPage("Minecraft Server Admin Page");
}
sub renderLogin {
	my ($self) = @_;
	$self->{output} .= $GUI->divStart("logon", "center");
	$self->{output} .= $GUI->divStart("logon1", "vertCenter");
        $self->{output} .= $GUI->h1("center", "Log in below");
        $self->{output} .= $GUI->br();
	$self->{output} .= $GUI->formStart("center","index.cgi", "post", "login");
	$self->{output} .= $GUI->input("username", "text", "username", "20", "20");
	$self->{output} .= $GUI->br();
	$self->{output} .= $GUI->input("pword", "password", "pword", "20", "20");
	$self->{output} .= $GUI->br();
	$self->{output} .= $GUI->input("submit", "submit","login");
	$self->{output} .= $GUI->formEnd();
	$self->{output} .= $GUI->divEnd();
        $self->{output} .= $GUI->divEnd();
}
sub renderLoginErrorPage {
	my ($self, $string) = @_;
	if ($string eq "LOGIN FAILED"){
		$self->startPage();
	        $self->{output} .= $GUI->divStart("main");
        	$self->{output} .= $GUI->divStart("headbox");
	        $self->{output} .= $GUI->divStart("header");
      		$self->{output} .= $GUI->h1("center", "Minecraft Server Admin Page");
        	$self->{output} .= $GUI->divEnd();
	        $self->{output} .= $GUI->br();

		$self->{output} .= $GUI->divStart("logon", "center");
        	$self->{output} .= $GUI->divStart("logon1", "vertCenter");
	        $self->{output} .= $GUI->h1("center", "Log in below");
		$self->{output} .= $GUI->span("error", $string);
	        $self->{output} .= $GUI->br();
        	$self->{output} .= $GUI->formStart("center","index.cgi", "post", "login");
	        $self->{output} .= $GUI->input("username", "text", "username", "20", "20");
	        $self->{output} .= $GUI->br();
	        $self->{output} .= $GUI->input("pword", "password", "pword", "20", "20");
		$self->{output} .= $GUI->br();
	        $self->{output} .= $GUI->input("submit", "submit","login");
	        $self->{output} .= $GUI->formEnd();
	        $self->{output} .= $GUI->divEnd();
		$self->{output} .= $GUI->divEnd();
	}

}
sub renderHomePage {
	my ($self) = @_;
        $self->headers();
        print "Set-Cookie: name=theshityo; path=/cgi-bin/;\n\n";
        print $GUI->startPage("Minecraft Server Admin");
        $self->{output} .= $GUI->divStart("main");
        $self->{output} .= $GUI->divStart("headbox");
        $self->{output} .= $GUI->divStart("header");
        $self->{output} .= $GUI->h1("center", "Minecraft Server Admin Page");
        $self->{output} .= $GUI->divEnd();
        $self->{output} .= $GUI->br();
        $self->{output} .= $GUI->divEnd();
        $self->{output} .= $GUI->divEnd();
        $self->displayPage();
}
sub renderServerOutput {
	#will display the Minecraft server output

}
sub renderMenu {

}

sub renderFooter{

}

sub renderHeader {

}

sub renderProfile {

}

sub displayPage{
	my ($self) = @_;
	print $self->{output};
	$self->{output} = "";
}
1;
