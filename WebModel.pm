#!/usr/bin/perl
#Author: Kodejunky
#Date: July 12, 2017
#File: WebPageModel.pm

package WebModel;

use strict;
use warnings;

use WebDB;
use Digest::SHA qw(hmac_sha256_base64);

my $db = WebDB->new();

sub new {
        my $class = shift;
        my %options = @_;
        my $self = {SESSIONID => "", %options};
        bless($self, $class);
        return($self);

}
sub sendServerMessage{
	my $string = @_;
}
sub getSessionId{
	my ($self, $string, $key) = @_;
	my $mac = hmac_sha256_base64($string, $key);
	$self->{SESSIONID} = $mac;
}
sub setCookie{
	#input the database values into the sessions table
	my ($sessionId, $expire, $path) = @_;
	#database input here;
}
sub validateSessionId {
	#get session info from database and validate if the session is still active.
	my ($self, $sessionID) = @_;
	my $response = $db->select("select * from SESSIONS where sessionID = '$sessionID';'");
	if($response eq "$response->{sessionID}"){
		##### blah you knoe
	}
}
sub login{
	my ($self, $user, $pass) = @_;
	my @response = $db->select("Select * from users where username = '".$user."' and password = '".$pass."';");
	if (($response[1] eq $user)&&($response[2] eq $pass)){
		if($response[3] == 1){
			return "adminAccount";
		}else{
	               	$self->getSessionId($user, $pass);
			#$self->logSuccessfulLogin($response->{id});
			return "homePage";
		}
	}else{
	#	$self->logFailedLogin();
		return "LOGIN_FAILED";
	}
}
sub logFailedLogin {
	my ($self, $connection, %userData) = @_;
	if ($userData{failed} eq $self->{failLimit}){
		#$self->blockIP($userData{IP});	
		return "BLOCKED";
	}else{
		return "TRY_AGAIN";
	}
}
sub createSessionId {
	#create the session id here if authenticated. Use the username sha256 key to generate session id
}
sub restartServer {

}

sub stopServer {

}

sub startServer {


}

sub firstStart {

}

sub reset {

}
1;
