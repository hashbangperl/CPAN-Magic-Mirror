package CPAN::MagicMirror;
use strict;
use warnings;

=head1 NAME

CPAN::MagicMirror - Perl extension for blah blah blah

=head1 VERSION

0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

=head1 DESCRIPTION

Magic Mirror is a "managed" mirror of CPAN, enabling you
to track upstream releases, bugs and changes and add your own
modules to the mirror easily.

=cut

use CPANPLUS::Backend;

my $cb      = CPANPLUS::Backend->new;
my $conf    = $cb->configure_object;

my $author  = $cb->author_tree('KANE');
my $mod     = $cb->module_tree('Some::Module');
my $mod     = $cb->parse_module( module => 'Some::Module' );

my @objs    = $cb->search(  type    => TYPE,
			    allow   => [...] );




=head1 SEE ALSO

* CPAN::Mini
* CPAN::Mini::Webserver

=head1 AUTHOR

Aaron Trevena, E<lt>teejay@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Aaron J Trevena

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.


=cut


1;
