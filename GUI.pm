#!/usr/bin/perl

#Author K0dejunky
#Date July 7, 2017
#Version 1.0

package GUI;

use strict;
use warnings;

sub new {
        my $class = shift;
        my %options = @_;
	my $self = {%options};
        bless($self, $class);
        return($self);

}
sub a {
	my $size = scalar @_;
	if ($size == 3){
		my ($self, $href, $link) = @_;
		return "<a href='$href'>$link</a> ";
	}
	if ($size == 4){
		my ($self, $class, $href, $link) = @_;
		return "<a class='$class' href='$href'>$link</a> "; 
	}
}
sub formStart {
	my $size = scalar @_;
	if ($size == 4){
		my ($self, $action, $method, $name) = @_;
		return "<form action='$action' method='$method' name='$name'> ";
	}
	if ($size == 5){
                my ($self,$class, $action, $method, $name) = @_;
		return "<form class='$class' action='$action' method='$method' name='$name'> ";
	}
}
sub formEnd {
	my ($self) = @_;
	return "</form> ";
}
sub input {
        my $size = scalar @_;
        if ($size == 4){
	        my ($self, $name, $type,$value) = @_;
		return "<input name='$name' type='$type' value='$value'/> ";
        }
	if ($size == 5){
                my ($self, $name, $class, $type, $value) = @_;
		return "<input name='$name' class='$class' type='$type' value='$value' /> ";
	}
	if ($size == 6){
	        my ($self, $name, $type, $value, $size, $max) = @_;
		return "<input name='$name' type='$type' value='$value' size='$size' maxlength='$max'/> ";
        }
	if($size == 7){
		my ($self, $name, $class, $type, $value, $size, $max) = @_;
		return "<input name='$name' class='$class' type='$type' value='$value' size='$size' maxlength='$max'/> ";
	}
}
sub divStart {
	my $size = scalar @_;
	if ($size == 2){
	        my ($self, $string) = @_;
		return "<div id='$string'> ";
	}
	if ($size == 3){
                my ($self,$string, $class) = @_;
		return "<div id='$string' class='$class'> ";
	}

}
sub divEnd {
	my ($self) = @_;
	return "</div> ";
}

sub clearPage {
        my ($self) = @_;
        $self->{output} = "";
}

sub headers {
        my ($self) = @_;
        return "Content-type: text/html\n\n";
}
sub startPage {
        my ($self, $title) = @_;
	return "<head> <title>$title</title> <meta http-equiv='content-type' content='text/html; charset=iso-8859-1' /> <meta name='description' content='Minecraft Server Admin Page' /> <meta name='keywords' content='minecraft,server,admin,mods,ops,op,mod,servers,admins,users,admin portal, minecraft server' /> <meta name='verify-v1' content='JXc3KveeHbrgl57Ihf6Vws5PdCi0JxDllmO4Z476c0Y=' /> <link rel='stylesheet' type='text/css' href='../style/MinecraftServerAdmin.css' /> <link rel='icon' type='image/png' href='../images/favicon.png' /> </head> ";
}

sub p {
	my $size = scalar @_;
	if ($size == 2){
	        my ($self, $string) = @_;
		return "<p>".$string."</p> ";
	}
	if ($size == 3){
		my ($self, $class, $string) = @_;
		return "<p class='$class'>".$string."</p> ";
	}
}

sub br {
        my ($self) = @_;
	return "<br/> ";
}

sub displayPage {
        my ($self) = @_;
        return $self->{output};
}

sub span {
        my ($self, $string) = @_;
	return "<span>".$string."</span> ";
}


sub h1 {
        my $size = scalar @_;
        if ($size == 2){
                my ($self, $string) = @_;
		return "<h1>".$string."</h1> ";
        }
        if ($size == 3){
                my ($self, $class, $string) =@_;
		return "<h1 class='$class'>".$string."</h1> ";
        }
}

sub h2 {
        my $size = scalar @_;
        if ($size == 2){
                my ($self, $string) = @_;
                return "<h2>".$string."</h2> ";
        }
        if ($size == 3){
                my ($self, $class, $string) =@_;
                return "<h2 class='$class'>".$string."</h2> ";
	}
}

sub h3 {
        my $size = scalar @_;
        if ($size == 2){
                my ($self, $string) = @_;
                return "<h3>".$string."</h3> ";
        }
        if ($size == 3){
                my ($self, $class, $string) =@_;
                return "<h3 class='$class'>".$string."</h3> ";
	}
        
}

sub h4 {
        my $size = scalar @_;
        if ($size == 2){
                my ($self, $string) = @_;
                return "<h4>".$string."</h4> ";
        }
        if ($size == 3){
                my ($self, $class, $string) =@_;
                return "<h4 class='$class'>".$string."</h4> ";
	}
        
}

sub center {
        my ($self) = @_;
	return "<center> ";
}

sub centerEnd {
        my ($self) = @_;
	return "</center> ";
}
1;
