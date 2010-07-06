package CPAN::MagicMirror::DB::Result::Module;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

CPAN::MagicMirror::DB::Result::Module

=cut

__PACKAGE__->table("module");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 module_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 module_version

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 module_version_numeric

  data_type: 'float'
  is_nullable: 1
  size: [6,6]

=head2 author_id

  data_type: 'integer'
  is_nullable: 0

=head2 module_derived_from

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 module_is_third_party

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 module_is_core

  data_type: 'float'
  default_value: 0.00
  is_nullable: 1
  size: [2,2]

=head2 module_is_bundle

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 module_requires_perl_version

  data_type: 'float'
  default_value: 0.00
  is_nullable: 1
  size: [2,2]

=head2 module_updated

  data_type: 'datetime'
  is_nullable: 1

=head2 module_checksum

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "module_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "module_version",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "module_version_numeric",
  { data_type => "float", is_nullable => 1, size => [6, 6] },
  "author_id",
  { data_type => "integer", is_nullable => 0 },
  "module_derived_from",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "module_is_third_party",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "module_is_core",
  {
    data_type => "float",
    default_value => "0.00",
    is_nullable => 1,
    size => [2, 2],
  },
  "module_is_bundle",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "module_requires_perl_version",
  {
    data_type => "float",
    default_value => "0.00",
    is_nullable => 1,
    size => [2, 2],
  },
  "module_updated",
  { data_type => "datetime", is_nullable => 1 },
  "module_checksum",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-06 19:50:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Tq/OkgMN0tXXWQsvr4uf6g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
