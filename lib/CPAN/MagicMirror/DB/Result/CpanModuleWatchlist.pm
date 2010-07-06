package CPAN::MagicMirror::DB::Result::CpanModuleWatchlist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

CPAN::MagicMirror::DB::Result::CpanModuleWatchlist

=cut

__PACKAGE__->table("cpan_module_watchlist");

=head1 ACCESSORS

=head2 module_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 watch_bugs

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 watch_releases

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 fetch_new_releases

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "module_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "watch_bugs",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "watch_releases",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "fetch_new_releases",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("module_name");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-06 19:50:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+rbQrIDIv4ChkYmaCDR13w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
