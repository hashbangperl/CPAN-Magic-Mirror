package CPAN::MagicMirror::DB::Result::RepoType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

CPAN::MagicMirror::DB::Result::RepoType

=cut

__PACKAGE__->table("repo_type");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 type_name

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 type_description

  data_type: 'text'
  is_nullable: 1

=head2 type_handler_name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "type_name",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "type_description",
  { data_type => "text", is_nullable => 1 },
  "type_handler_name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-08-27 13:02:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cdcCK+ty0SwKMGVsTmtTrg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
