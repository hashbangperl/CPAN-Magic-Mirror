package CPAN::MagicMirror::DB::Result::UpstreamRepo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

CPAN::MagicMirror::DB::Result::UpstreamRepo

=cut

__PACKAGE__->table("upstream_repo");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 repo_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 repo_url

  data_type: 'varchar'
  is_nullable: 0
  size: 512

=head2 repo_type_id

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "repo_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "repo_url",
  { data_type => "varchar", is_nullable => 0, size => 512 },
  "repo_type_id",
  { data_type => "integer", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-08-27 13:02:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NTN9sMSC8a8RgBKiw2n1kg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
