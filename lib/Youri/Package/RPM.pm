# $Id$
package Youri::Package::RPM;

=head1 NAME

Youri::Package::RPM - Base class for all RPM-based package implementation

=head1 DESCRIPTION

This bases class factorize code between various RPM-based package
implementation.

=cut

use strict;
use warnings;
use base 'Youri::Package';
use version; our $VERSION = qv('0.2.0');
use Carp;
use UNIVERSAL::require;

sub get_wrapper_class {
    if (RPM4->require()) {
        Youri::Package::RPM::RPM4->require();
        return 'Youri::Package::RPM::RPM4';
    }

    if (RPM->require()) {
        Youri::Package::RPM::RPM->require();
        return 'Youri::Package::RPM::RPM';
    }

    if (URPM->require()) {
        Youri::Package::RPM::URPM->require();
        return 'Youri::Package::RPM::URPM';
    }

    croak "No RPM bindings available";
}

sub get_pattern {
    my ($class, $name, $version, $release, $arch) = @_;

    return $class->get_unquoted_pattern(
        $name ? quotemeta($name) : undef,
        $version ? quotemeta($version) : undef,
        $release ? quotemeta($release) : undef,
        $arch ? quotemeta($arch) : undef
    );
}

sub get_unquoted_pattern {
    my ($class, $name, $version, $release, $arch) = @_;

    return 
        ($name ? $name : '[\w-]+' ).
        '-' .
        ($version ? $version : '[^-]+' ).
        '-' .
        ($release ? $release : '[^-]+' ). 
        '\.' .
        ($arch ? $arch : '\w+' ).
        '\.rpm';
}

sub as_file {
    my ($self) = @_;
    croak "Not a class method" unless ref $self;

    return $self->{_file};
}

sub is_debug {
    my ($self) = @_;
    croak "Not a class method" unless ref $self;

    return $self->get_name() =~ /-debug$/;
}

1;
