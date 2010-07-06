package CPAN::MagicMirror::Model::CPANPLUS;
use strict;

use CPANPLUS::Backend;

my $cb      = CPANPLUS::Backend->new;
my $conf    = $cb->configure_object;

my $author  = $cb->author_tree('KANE');
my $mod     = $cb->module_tree('Some::Module');
my $mod     = $cb->parse_module( module => 'Some::Module' );

my @objs    = $cb->search(  type    => TYPE,
			    allow   => [...] );



=head1 AUTHOR

Aaron Trevena, E<lt>teejay@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Aaron J Trevena

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.


1;
