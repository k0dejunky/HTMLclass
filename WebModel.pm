#!/usr/bin/perl
#Author: Kodejunky
#Date: July 12, 2017
#File: WebPageModel.pm

package WebModel;

use strict;
use warnings;

use DBI;
use Digest::SHA qw(hmac_sha256_base64);

my %config;
if (-e "db.conf"){
        #open the file and read into the config array
}else{
        die("error no db.conf file");
}

sub new {
        my $class = shift;
        my %options = @_;
        my $self = {SESSIONID => "", %options};
        bless($self, $class);
        return($self);

}
sub sendServerMessage {
	my $string = @_;
}
sub getSessionId{
	my ($string, $key) = @_;
	my $mac = hmac_sha256_base_64($string, $key);
	return $mac;
}
sub setCookie{
	#input the database values into the sessions table
	my ($sessionId, $expire, $path) = @_;
	#database input here;
}
sub validateSessionId {
	#get session info from database and validate if the session is still active.
	my ($sessionID) = @_;
}
sub login {
	my ($self, $user, $pass) = @_;
	my $response = ""; # the response will be the sql return from DBI for the authentication of user login.
	if ($response){
                $self->getSessionId($user, $pass);
#		$self->logSuccessfulLogin($response{userid});
		return "homePage";
	}else{
		$self->logFailedLogin();
		return "LOGIN FAILED";
	}
}
sub logFailedLogin {
#	my ($self, $connection, %userData) = @_;
#	if ($userData{failed} eq $self->{failLimit}){
#		$self->blockIP($userData{IP});	
#		return "BLOCKED";
#	}else{
#		return "TRY_AGAIN";
#	}
	
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
