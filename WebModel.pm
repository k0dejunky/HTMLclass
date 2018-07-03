#!/usr/bin/perl -WT
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
sub createCSRFToken {
	# stuff here
}
sub createSessionId{
	my ($self, $string, $key) = @_;
	my $secureString = $string . time();
	my $mac = hmac_sha256_base64($secureString, $key);
	$mac  =~ s/[^a-zA-Z0-9,]//g;
	my $expire = (time() + (12*60*60));
#	my $CSRF = $self->createCSRFToken();
	my $cookie = "Cookie: MinecraftServerBlog=$mac\n"; # sets the cookie data
	my $setCookie = $self->setCookie($mac, $string, $expire);
	if($setCookie =~ /SET/){
		return $cookie;
	}else{
		return $setCookie;
	}
}
sub setCookie{
	#input the database values into the sessions table
	my ($self, $session, $user, $expired) = @_;
	#database input here;
	#print "Content-type: text/html\n\n";
	#print "sess: " . $session . " Username: " . $user . " Expire: " . $expired;
	my $insert = $db->insert("insert into SESSIONS (sessionID, username, expire) values ('$session', '$user', $expired)");
	if($insert =~/COMPLETE/){
		return "SET";
	}else{
		return $insert;
	}
}
sub validateSessionId {
	#get session info from database and validate if the session is still active.
	my ($self, $sessionID) = @_;
	my $response = $db->select("select * from SESSIONS where sessionID = '$sessionID';'");
	if($sessionID eq "$response->{sessionID}"){
		##### blah you knoe
		if($response->{expire} > time()){
			return $response;
		}else{
			return 0;
		}
	}else{
		return 0;
	}
}
sub login{
#	my $ARGS = scalar @_;
#	if($ARGS == 3){
		my ($self, $user, $pass) = @_;
		if($user && $pass){
			my $response = $db->select("Select * from users where username = '".$user."' and password = '".$pass."';");
			if($response){
				if (($response->{username} =~ /$user/)&&($response->{password} =~ /$pass/)){
					return $response;	
				}else{
					return {error => "LOGIN_FAILED"};
					
				}
			}else{
				return {error => "U_OR_P_NF"};
			}
		}else{
			return {error => "U_OR_P_NE"};
		}
#	}
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
