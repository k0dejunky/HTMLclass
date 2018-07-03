#!/usr/bin/perl -WT
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
	$self->{output} .= $GUI->startPage({title => "minecraft User Portal Page"});
	$self->{output} .= $GUI->divStart("main");
	$self->{output} .= $GUI->divStart("headbox");
        $self->{output} .= $GUI->divStart("header");
	$self->{output} .= $GUI->h1({class => "center", string => "Minecraft User Portal Login Page"});
        $self->{output} .= $GUI->divEnd();
	$self->{output} .= $GUI->br();
	$self->renderLogin();
        $self->{output} .= '<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>';
        $self->{output} .= '<script>window.jQuery || document.write(\'<script type="text/javascript" src="/var/www/k0dejunky.com/public_html/noName/bs/js/vendor/jquery.min.js"><\/script>\')</script>';
        $self->{output} .= '<script type="text/javascript" src="/var/www/k0dejunky.com/public_html/noName/bs/js/bootstrap.min.js"></script>';
        $self->{output} .= '<script type="text/javascript" src="/var/www/k0dejunky.com/public_html/noName/js/feUtil.js"></script>';
	$self->{output} .= $GUI->divEnd();
        $self->{output} .= $GUI->divEnd();
}
sub headersCookie{
	my ($self, $cookie) = @_;
	$GUI->headersCookie($cookie);
}
sub renderManageAdmins {
	my ($self) = @_;
	$self->{output} = $GUI->h1({class => "center", string => "Manage Admins"});
}
sub renderLogin {
	my ($self) = @_;
	$self->{output} .= $GUI->divStart("logon", "center");
	$self->{output} .= $GUI->divStart("logon1", "vertCenter");
        $self->{output} .= $GUI->h1({class => "center", string => "Log in below"});
        $self->{output} .= $GUI->br();
	$self->{output} .= $GUI->formStart("login", "center","index.cgi", "post", "login");
	$self->{output} .= $GUI->input({name=>"username",class=>"center",type=>"text",size=>"20",maxLength=>"20", placeholder =>"username"});
	$self->{output} .= $GUI->br();
	$self->{output} .= $GUI->input({name=>"pword",class=>"center",type=>"password",size=>"20",maxLength=>"20",placeholder=>"pword"});
	$self->{output} .= $GUI->br();
	$self->{output} .= $GUI->button({name=>"submit",class=>"btn btn-primary", type=>"submit",value=>"login", formaction=>"index.cgi", formid=>"login", formmethod=>"post"});
	$self->{output} .= $GUI->formEnd();
	$self->{output} .= $GUI->divEnd();
        $self->{output} .= $GUI->divEnd();
}
sub renderLoginErrorPage {
	my ($self, $string) = @_;
		$self->{output} .= $GUI->startPage({title => "Minecraft User Portal Login Page"});
	        $self->{output} .= $GUI->divStart("main");
        	$self->{output} .= $GUI->divStart("headbox");
	        $self->{output} .= $GUI->divStart("header");
      		$self->{output} .= $GUI->h1({class => "center", string => "Minecraft User Portal Login Page"});
        	$self->{output} .= $GUI->divEnd();
	        $self->{output} .= $GUI->br();
		$self->{output} .= $GUI->divStart("logon", "center");
        	$self->{output} .= $GUI->divStart("logon1", "vertCenter");
	        $self->{output} .= $GUI->h1({class => "center", string => "Log in below"});
		$self->{output} .= $GUI->span("$string");
	        $self->{output} .= $GUI->br();
        	$self->{output} .= $GUI->formStart("center","index.cgi", "post", "login");
	        $self->{output} .= $GUI->input({name=>"username", class=>"center", type=>"text", placeholder=>"username", size=>"20",maxLength=> "20"});
	        $self->{output} .= $GUI->br();
	        $self->{output} .= $GUI->input({name=>"pword", class=>"center", type=>"password",placeholder=>"pword",size=> "20",maxLength=>"20"});
		$self->{output} .= $GUI->br();
	        $self->{output} .= $GUI->input({name=>"submit", type=>"submit", value=>"login"});
	        $self->{output} .= $GUI->formEnd();
	        $self->{output} .= $GUI->divEnd();
		$self->{output} .= $GUI->divEnd();
}
sub renderHomePage {
	my ($self, $data) = @_;
        $self->{output} = $GUI->startPage({title => "Minecraft Character Blog"});
        $self->{output} .= $GUI->divStart("main");
        $self->{output} .= $GUI->divStart("headbox", "center");
        $self->{output} .= $GUI->divStart("header", "center");
        $self->{output} .= $GUI->h1({class => "center", string => "$data->{username} Welcome to your character blog!"});
        $self->{output} .= $GUI->divEnd();
	$self->{output} .= $GUI->divEnd();
        $self->{output} .= $GUI->divStart("container");
        $self->{output} .= $GUI->divStart("content");
        $self->{output} .= $GUI->divStart("left");
#this is the start of the navigation menu
	$self->{output} .= $GUI->divStart("navmen");
	$self->{output} .= $GUI->p("center", "Page Navigtion");
	$self->{output} .= $GUI->br();
	$self->{output} .= $GUI->a("center","index.cgi?mode=editprofile","Edit Profile");
	$self->{output} .= $GUI->br();
        $self->{output} .= $GUI->a("center","index.cgi?mode=photogallery","Photo Gallery");
	$self->{output} .= $GUI->br();
        $self->{output} .= $GUI->a("center","index.cgi?mode=friendsList","Friends List");

	$self->{output} .= $GUI->divEnd(); #end nav menu
	$self->{output} .= $GUI->divEnd(); 
	$self->{output} .= $GUI->divStart("middle");
        $self->{output} .= $GUI->p("center", "Content");
        $self->{output} .= $GUI->divEnd();
        $self->{output} .= $GUI->divStart("right");
	$self->{output} .= $GUI->divStart("profileInfo");

	$self->{output} .= $GUI->h3("center", "$data->{username}");
	$self->{output} .= $GUI->p("center", "Email Address: $data->{email}");
	$self->{output} .= $GUI->br();
        $self->{output} .= $GUI->a("center","index.cgi?mode=profilesettings","Profile Settings");
	$self->{output} .= $GUI->divEnd();
	

        $self->{output} .= $GUI->divEnd();
	$self->{output} .= $GUI->divEnd(); # this was just added
$self->{output} .= $GUI->divEnd();
        $self->{output} .= $GUI->divStart("footer");
        $self->{output} .= $GUI->br();
	$self->{output} .= $GUI->p("center", "This is the page footer, There will eventually be links, faq, and contact info. Stay tuned for more!!!");
        $self->{output} .= $GUI->divEnd();
#	$self->{output} .= $GUI->divEnd();
        $self->{output} .= '<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>';
        $self->{output} .= '<script>window.jQuery || document.write(\'<script src="/var/www/k0dejunky.com/public_html/noName/bs/js/vendor/jquery.min.js"><\/script>\')</script>';
        $self->{output} .= '<script src="/var/www/k0dejunky.com/public_html/noName/bs/js/bootstrap.min.js"></script>';
        $self->{output} .= '<script src="/var/www/k0dejunky.com/public_html/noName/js/feUtil.js"></script>';
        $self->{output} .= '</body>';
        $self->{output} .= '</html>';

#	$self->{output} .= $self->renderContent();
#	$self->{output} .= $self->renderFooter();
#	$self->{output} .= $self->closePage();
#	$self->{output} .= $GUI->divEnd();
}
sub renderContent {
	my ($self, $data) = @_;
	$self->{output} .= $GUI->divStart("container");
	$self->{output} .= $GUI->divStart("content");
	$self->{output} .= $GUI->divStart("left");
	$self->{output} .= $GUI->p("center", "Left");
	$self->{output} .= $GUI->divEnd();
	$self->{output} .= $GUI->divStart("middle");
	$self->{output} .= $GUI->p("center", "Middle");
	$self->{output} .= $GUI->divEnd();
	$self->{output} .= $GUI->divStart("right");
	$self->{output} .= $GUI->p("center", "Right");
	$self->{output} .= $GUI->divEnd();
}
sub renderServerOutput {
	#will display the Minecraft server output
}
sub renderAdminPage{
        my ($self) = @_;
        $self->{output} = $GUI->startPage({title => "Minecraft Character Blog"});
        $self->{output} .= $GUI->divStart("main");
        $self->{output} .= $GUI->divStart("headbox");
        $self->{output} .= $GUI->divStart("header");
        $self->{output} .= $GUI->h1({class => "center", string => "Minecraft Server Management Utility"});
        $self->{output} .= $GUI->divEnd();
        $self->{output} .= $GUI->br();
        $self->{output} .= $GUI->divEnd();
        $self->{output} .= $GUI->divEnd();
}
sub renderMenu {

}

sub renderFooter{
	my ($self) = @_;
	$self->{output} .= $GUI->divStart("footer");
	$self->{output} .= $GUI->p("center", "This is the page footer, There will eventually be links, faq, and contact info. Stay tuned for more!!!");
	$self->{output} .= $GUI->divEnd();
        $self->{output} .= '<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>';
        $self->{output} .= '<script>window.jQuery || document.write(\'<script src="bs/js/vendor/jquery.min.js"><\/script>\')</script>';
        $self->{output} .= '<script src="bs/js/bootstrap.min.js"></script>';
        $self->{output} .= '<script src="js/feUtil.js"></script>';

}
sub closePage {
	my ($self) = @_;
	$self->{output} .= '</body>';
	$self->{output} .= '</html>';
}
sub renderHeader {

}

sub renderProfile {

}

sub displayPage{
	my ($self) = @_;
	print $self->{output};
}
1;
