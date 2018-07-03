#!/usr/bin/perl -T

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
sub button {
#	my $size = scalar @_;
#	if ($size == 3){
#		my ($self, $name, $type, $formmethod, $value, $text) = @_#;
#		return "<button type=$type>$text</button>";
#	}elsif($size = 4){
#		my ($self, $class, $type, $text)
#	}
my ($self, $data) = @_;
	if($data->{name} && $data->{class} && $data->{type} && $data->{value} && $data->{formaction} && $data->{formid} && $data->{formmethod}){
		return "<button name='$data->{name}' class=$data->{class} type='$data->{type}' formaction='$data->{formaction}' formid='$data->{formid}'>$data->{value}</button>";
	}
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
		my ($self, $id, $action, $method, $name) = @_;
		return "<form id='$id' action='$action' method='$method' name='$name' accept-charset=utf-8>\n ";
	}
	if ($size == 5){
                my ($self,$id, $class, $action, $method, $name) = @_;
		return "<form id='$id' class='$class' action='$action' method='$method' name='$name' accept-charset=utf-8>\n ";
	}
}
sub formEnd {
	my ($self) = @_;
	return "</form> ";
}
sub input {
	my ($self, $data, $attributes) = @_;
	if($attributes->{accept}){
		
	}
	if($data->{name} && $data->{class} && $data->{type} && $data->{size} && $data->{maxLength} && $data->{placeholder}){
		return "<input name='$data->{name}' class='$data->{class}' type='$data->{type}' size='$data->{size}' maxlength='$data->{maxLength}' placeholder='$data->{placeholder}'>";
	}elsif($data->{name} && $data->{type} && $data->{size} && $data->{maxLength}){
		return "<input name='$data->{name}' type='$data->{type}' size='$data->{size}' maxlength='$data->{maxLength}'/> ";
	}elsif($data->{name} && $data->{class} && $data->{type}){
                return "<input name='$data->{name}' class='$data->{class} type='$data->{type}'/>";
        }elsif($data->{name} && $data->{type} && $data->{value}){
		return "<input name='$data->{name}' type='$data->{type}' value='$data->{value}'/>";
	}elsif($data->{name} && $data->{type}){
                  return "<input name='$data->{name}' type='$data->{type}'/>";
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
sub headersCookie {
	my ($self, $cookie) = @_;
	print "Content-type: text/html\n";
	print $cookie;
}
sub startPage {
        my ($self, $data) = @_;
	return "<head> <title>$data->{title}</title> <meta http-equiv='content-type' content='text/html; charset=iso-8859-1' /> <meta name='description' content='Minecraft Server Admin Page' /> <meta name='keywords' content='minecraft,server,admin,mods,ops,op,mod,servers,admins,users,admin portal, minecraft server' /> <link rel='stylesheet' type='text/css' href='../style/minecraftServerAdmin.css' /></head><html><body> ";
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
	my $size = scalar @_;
	if ($size == 2){
		my ($self, $string) = @_;
		return "<span>".$string."</span> ";
	}
	if ($size == 3){
		my ($self, $string, $style) = @_;
		return "<span style='".$style."'>".$string."</span>";
	}
}

sub h1 {
        my ($self, $data) = @_;
        if ($data->{class} && $data->{string}){
                return "<h1 class='$data->{class}'>".$data->{string}."</h1> ";
        }
        if ($data->{string}){
                my ($self, $string) = @_;
		return "<h1>".$data->{string}."</h1> ";
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
1;
