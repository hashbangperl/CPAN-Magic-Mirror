package CPAN::MagicMirror::DB::Result::Author;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

CPAN::MagicMirror::DB::Result::Author

=cut

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


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-06 19:50:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LqTj2d6O1CJMGEfB0cztkQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
