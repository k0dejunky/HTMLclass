#!usr/bin/perl -WT

#Author: Kodejunky
#Date: July 12, 2017
#File: WebPageController
#Description: This is the controller class for perl webpage control. This class updates the model, reads the model and selects and displays the correct veiw depending on the state of the model. The controller will handle all HTTP requests, and POST data.

package WebController;

BEGIN { use lib "/usr/lib/cgi-bin"; }
use strict;
use warnings;

use Data::Dumper;

use WebModel;
use WebTemplater;
my $mdl = WebModel->new();
my $tmpl = WebTemplater->new();

sub new {
        my $class = shift;
        my %options = @_;
        my $self = {send => "",receive => "",cookie => "",  %options};
	my $hdr = {hdr => "", cookiehdr => "", csshdr => "", endhdr => "\n"};
	my $pg = 
        bless($self, $class);
        return($self);

}

sub setCookie {
	my ($self, $cookie) = @_;
	return $mdl->setCookie($cookie);
}

sub getCookie {
	my ($self, $cookiename) = @_;
	if($ENV{HTTP_COOKIE}){
		my @cookies = split(/&/, $ENV{HTTP_COOKIE});
		foreach (@cookies){
			my @tokens = split(/=/, $_);
			return $tokens[1] if($tokens[0] eq $cookiename);
		}
	}elsif($ENV{QUERY_STRING}){
		my @cookies = split(/&/, $ENV{QUERY_STRING});
		foreach (@cookies){
			my @tokens = split(/=/, $_);
			return $tokens[1] if($tokens[0] =~ /$cookiename/);
		}
	}
}

sub login {
	my ($self, $user, $pass) = @_;
	my $loginResponce = ($mdl->login($user, $pass));
	my @returnVals;
	if ($loginResponce->{error}){
		if($loginResponce->{error} =~ /U_OR_P_NE/){
			return {error => $tmpl->renderLoginErrorPage('Username or password Not Entered')};
		}elsif($loginResponce->{error} =~ /U_OR_P_NF/){
			return {error => $tmpl->renderLoginErrorPage('Username or Password Not Found')};
		}else{
			return {error => $tmpl->renderLoginErrorPage($loginResponce->{error})};
		}
	}elsif($loginResponce->{username} =~ /$user/ && $loginResponce->{password} =~/$pass/){
		if($loginResponce->{isAdmin} == 0){
			return {cookie => $mdl->createSessionId($user, $pass), info => $loginResponce};
                }else{
			return {cookie => $mdl->createSessionId($user, $pass), info => $loginResponce};
 		}	
	}else{
		return {error => "WHAT_THE_FUCK"};
	}
}
sub login2 {
#        my ($self, $user, $pass) = @_;
#        my @loginResponce = ($mdl->login($user, $pass));
#        print "Content-type: text/html\n\n";
#        print Dumper $loginResponce;
#        #sleep(15);
#	exit();
#        my @returnVals;
#                #print "Content-type: text/html\n\n";
#                #print Dumper @loginResponce;
#                #print $loginResponce[0];
#                #print "login2: " . $loginResponce[1];
#                #exit();
#        if($loginResponce[0] && $loginResponce[1#]){
#                if($loginResponce->{isAdmin} == 0){
#                        #return @loginResponce;
#                        #push @returnVals, $loginResponce[0];
#                        #push @returnVals, $tmpl->renderHomePage($loginResponce[1]);
#                        #return @returnVals;
#                        my $cookie = $mdl->createSessionId($user, $pass);
#                        push @returnVals, $cookie;
#                        push @returnVals, $tmpl->renderHomePage($loginResponce);
#                        return @returnVals;
#                }elsif($loginResponce[1] =~ /adminAccount/){
#                        #return @loginResponce;
#                        my $cookie = $mdl->createSessionId($loginResponce->{username}, $loginResponce->{password});
#                        push @returnVals, $cookie;
#                        push @returnVals, $tmpl->renderAdminAccount($loginResponce[1]);
#                        return @returnVals;
#
#                }
#        }elsif($loginResponce[0]){
#                #print "Content-type: text/html\n\n";
#                #print Dumper @loginResponce;
#                #print $loginResponce[0];
#                #print "login2: " . $loginResponce[1];
#                #exit();
#                if($loginResponce->{error} =~ /U_OR_P_NE/){
#                        return $tmpl->renderLoginErrorPage("Username or password Not Entered");
#                }elsif($loginResponce->{error} =~ /U_OR_P_NF/){
#                        return $tmpl->renderLoginErrorPage("Username or Password Not Found");
#                }else{
#                        return $tmpl->renderLoginErrorPage($loginResponce[0]);
#                }
#        }else{
#                #return $loginResponce[1];
#                return "WHAT_THE_FUCK";
#        }
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
	my @retvals;
	push @retvals, @uname;
	push @retvals, @pword;
	push @retvals, @mtd;
	return @retvals;
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
sub validateCookie {
	my ($self, $sessionID) = @_;
	return $mdl->validateSessionId($sessionID);
}
sub renderHomePage {
	my ($self, $data) = @_;
	$tmpl->renderHomePage($data);
}
sub start {
	my ($self) = @_;
	return $tmpl->start();
}
sub url_decode {
	my ($self, $text) = @_;
	$text =~ tr/ /+/;
	$text =~ s/%([a-f0-9][a-f0-9])/chr( hex( $1 ))/egi;
	return $text;
}
sub url_encode {
	my ($self, $text) = @_;
	#$text =~ s/([^a-z0-9_.!~*'\(\)-])/sprintf *%%%02X*, ord($1)/egi;
	$text =~ tr/ /+/;
	return $text;
}


1;
