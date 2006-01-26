# $Id$
package Youri::Package::Base;

=head1 NAME

Youri::Package::Base - Abstract package class

=head1 DESCRIPTION

This abstract class defines Youri::Package interface.

=cut

use Carp;
use strict;
use warnings;

use constant DEPENDENCY_NAME => 0;
use constant DEPENDENCY_RANGE => 1;

use constant FILE_NAME => 0;
use constant FILE_MODE => 1;
use constant FILE_MD5SUM => 2;

=head1 CLASS METHODS

=head2 new(%args)

Creates and returns a new Youri::Package object.

Warning: do not call directly, call subclass constructor instead.

=cut

sub new {
    my $class   = shift;
    my %options = (
        @_
    );

    my $self = bless {
    }, $class;

    $self->_init(%options);

    return $self;
}

sub _init {
    # do nothing
}

=head1 INSTANCE METHODS

=head2 age()

Returns the age of this package

=cut

sub age {
    croak "Not implemented method";
}

=head2 source_package()

Returns the name of the source package of this package.

=cut

sub source_package {
    croak "Not implemented method";
}

=head2 canonical_name()

Returns the canonical name of this package, shared by its multiple components,
usually the one from the source package.

=cut

sub canonical_name {
    croak "Not implemented method";
}

=head2 buildtime()

Returns the time of last build, in number of second since epoch (like time()).

=cut

sub buildtime {
    croak "Not implemented method";
}

=head2 requires()

Returns the list of dependencies required by this package, each dependency
being represented as an array reference, with the following informations:

=over

=item B<name>

Name of the dependency (index DEPENDENCY_NAME)

=item B<range>

Range of the dependency (index DEPENDENCY_RANGE)

=back

For more conveniency, fields index are available as constant in this package.

=cut

sub requires {
    croak "Not implemented method";
}

=head2 provides()

Returns the list of dependencies provided by this package, each dependency
being represented as an array reference, using the same structure as previous method.

=cut

sub provides {
    croak "Not implemented method";
}

=head2 files()

Returns the list of files contained in this package, each file being
represented as an array reference, , with the following informations:

=over

=item B<name>

Name of the file (index FILE_NAME).

=item B<mode>

Mode of the file (index FILE_MODE).

=item B<md5sum>

Md5sum of the file (index FILE_MD5SUM).

=back

For more conveniency, fields index are available as constant in this package.

=cut

sub files {
    croak "Not implemented method";
}

=head2 gpg_key()

Returns the gpg key id of package signature.

=cut

sub gpg_key {
    croak "Not implemented method";
}

=head1 SUBCLASSING

All instances methods have to be implemented.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2002-2006, YOURI project

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=cut

1;
