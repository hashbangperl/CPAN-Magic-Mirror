package CPAN::MagicMirror::DB::Result::Author;
use strict;
use warnings;

=head1 NAME

CPAN::MagicMirror::DB::Result::Author

=head1 DESCRIPTION

A module author - a real person can have multiple module author entries, i.e. an internal one using work email, and a home/other CPAN author entry

=cut

use base 'DBIx::Class::Core';

__PACKAGE__->table("author");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 author_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 author_pauseid

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 author_internalid

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 author_email

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 author_website

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "author_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "author_pauseid",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "author_email",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "author_website",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 modules

Type: has_many

Related object: L<CPAN::MagicMirror::DB::Result::Module>

=cut

__PACKAGE__->has_many(
  "modules",
  "CPAN::MagicMirror::DB::Result::Module",
  { "foreign.author_id" => "self.id" },
);

=head2 METHODS

=head2 dist_path

Z/ZA/ZAG/

=cut

sub dist_path {
    my $row = shift;
    my $ident = $row->author_pauseid || $row->author_internalid;
    my ($a, $b) = split('',$ident);
    my $path = "$a/$a$b/$ident/";
    return $path;
}



1;
