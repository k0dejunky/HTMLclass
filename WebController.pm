#!usr/bin/perl

#Author: Kodejunky
#Date: July 12, 2017
#File: WebPageController
#Description: This is the controller class for perl webpage control. This class updates the model, reads the model and selects and displays the correct veiw depending on the state of the model. The controller will handle all HTTP requests, and POST data.

package WebController;

use strict;
use warnings;

use WebModel;
use WebTemplater;

my $mdl = WebModel->new();
my $tmpl = new WebTemplater;
sub new {
        my $class = shift;
        my %options = @_;
        my $self = {send => "",receive => "",cookie => "",  %options};
        bless($self, $class);
        return($self);

}

sub setCookie {
	my ($self, $username, $password, $type) = @_;
	my $secure = 1;
	my $expire = gmtime(time()+1*24*3600) . " GMT"; #sets the epire time to expire in 1 hour
	my $sessionID = $mdl->getSessionId($username, $password);
	my $cookie = "WebMVCServerAdmin=$sessionID; path=/; expires=$expire"; # sets the cookie data
	$self->{cookie} =  "Set-cookie: " . $cookie . "\n\n"; # sets the cookie
	return $self->{cookie}; #returns the cookie to the viewer
}

sub getCookie {
	my ($self, $cookiename) = @_;
	my @cookies = split(/\s*;\s*/, $ENV{'HTTP_COOKIE'});
	foreach (@cookies){
		my @tokens = split(/=/, $_);
		return $tokens[1] if($tokens[0] eq $cookiename);
	}
#	return '';
}

sub login {
	my ($self, $user, $pass) = @_;
	my $loginResponce = $mdl->login($user, $pass);
	if ($loginResponce eq 'LOGIN_FAILED'){
		return "LOGIN_FAILED";
	}elsif($loginResponce eq "homePage"){
		return $loginResponce;
	}elsif($loginResponce eq "adminAccount"){
		return $loginResponce;
	}else{
		return "NO_RESPONSE_TRY_AGAIN";
	}
}
sub processRequest{
	
}

sub parcePost {
	my ($self, $INPUT) = @_;
	my (@uname, @pword, @mtd);
	if ((index($INPUT, "username")>0)&&(index($INPUT, "password")>0)&&(index($INPUT, "submit")>0)){
		my  ($username, $password, $method)= $self->parceInput($INPUT);
		if (index($username, "username=")>0){
			@uname = $self->parceInput($username);
		}
		if (index($password, "pword=")>0){
			@pword = $self->parceInput($password);
		}
		if (index($method, "submit=")>0){
			@mtd = $self->parceInput($method);
		}
	}
	return (\@uname,\@pword,\@mtd);
}
sub parceInput {
	my ($self,$string) = @_;
	if ((index($string, "&")>0)&&(index($string, "=")>0)){
		return split(/&/,$string);
	}elsif (index($string, "=")>0&&(index($string, "&")==-1)){
		return split(/=/,$string);
	}
}
sub processMode {

}
sub setMode {

}
sub restartServer {

}
sub stopServer {

}
sub getMods {

}
1;
