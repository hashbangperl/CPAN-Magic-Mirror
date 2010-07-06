package CPAN::MagicMirror::DB::Result::CpanLatestModuleVersion;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

CPAN::MagicMirror::DB::Result::CpanLatestModuleVersion

=cut

__PACKAGE__->table("cpan_latest_module_versions");

=head1 ACCESSORS

=head2 module_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 latest_cpan_version

  data_type: 'float'
  default_value: 0.000000
  is_nullable: 0
  size: [6,6]

=head2 updated

  data_type: 'datetime'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "module_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "latest_cpan_version",
  {
    data_type => "float",
    default_value => "0.000000",
    is_nullable => 0,
    size => [6, 6],
  },
  "updated",
  { data_type => "datetime", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("module_name", "latest_cpan_version");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-06 19:50:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PSuXL+MPs4/z1dbKnN02wQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
