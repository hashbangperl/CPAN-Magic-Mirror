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

  script/cpan_magicmirror_server.pl


=head1 DESCRIPTION

Magic Mirror is a "managed" mirror of CPAN, enabling you
to track upstream releases, bugs and changes and add your own
modules to the mirror easily.

=cut

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use parent qw/Catalyst/;
use Catalyst qw/-Debug
                ConfigLoader
                Static::Simple/;

__PACKAGE__->config(
		    name => 'CPAN::MagicMirror',
		    'default_view' => 'TT',
		    'Model::DB' => {
				    connect_info => [ 'dbi:mysql:dbname=magic_mirror', 'mirror_user', 'h3art0fap1g',  ]
				   },
		   );

# Start the application
__PACKAGE__->setup();



=head1 SEE ALSO

=over 4

=item L<CPAN::Mini>
=item L<CPAN::Mini::Webserver>
=item L<CPAN::MagicMirror::Controller::Root>
=item L<Catalyst>

=back

=head1 AUTHOR

Aaron Trevena, E<lt>teejay@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Aaron J Trevena

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.


=cut


1;
