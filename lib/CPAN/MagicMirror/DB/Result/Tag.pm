package CPAN::MagicMirror::DB::Result::Tag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

CPAN::MagicMirror::DB::Result::Tag

=cut

__PACKAGE__->table("tags");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 tag_name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 tag_comment

  data_type: 'text'
  is_nullable: 1

=head2 created

  data_type: 'datetime'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "tag_name",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "tag_comment",
  { data_type => "text", is_nullable => 1 },
  "created",
  { data_type => "datetime", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-06 19:50:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RYczrdrKsepQ2XH8JjvsuA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
