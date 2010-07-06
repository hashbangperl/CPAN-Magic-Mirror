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

Aaron Trevena.

=head1 COPYRIGHT & LICENSE


=cut


1;

