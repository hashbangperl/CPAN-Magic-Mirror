package CPAN::MagicMirror::Model::DB;
use strict;

=head1 NAME

CPAN::MagicMirror::Model::DB`

=head1 DESCRIPTION

Model providing access to magic mirror DBIC schema

=head1 SYNOPSIS

    my $schema = $c->model('DB'); # get dbic schema

   my $authorss_rs = $c->model('DB::Author'); # get Resultset

=cut

use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'CPAN::MagicMirror::DB',
);


=head1 SEE ALSO

Catalyst

Catalyst::Model::DBIC::Schema

DBIx::Class

=head1 AUTHOR

Aaron Trevena, E<lt>teejay@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Aaron J Trevena

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.

=cut

1;

