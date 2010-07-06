package CPAN::MagicMirror::DB::Result::TaggedModule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

CPAN::MagicMirror::DB::Result::TaggedModule

=cut

__PACKAGE__->table("tagged_modules");

=head1 ACCESSORS

=head2 module_id

  data_type: 'integer'
  is_nullable: 0

=head2 tag_id

  data_type: 'integer'
  is_nullable: 0

=head2 tag_created

  data_type: 'datetime'
  is_nullable: 1

=head2 tag_updated

  data_type: 'datetime'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "module_id",
  { data_type => "integer", is_nullable => 0 },
  "tag_id",
  { data_type => "integer", is_nullable => 0 },
  "tag_created",
  { data_type => "datetime", is_nullable => 1 },
  "tag_updated",
  { data_type => "datetime", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("module_id", "tag_id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-06 19:50:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:80EanT4zQ+ThGJTea1uxwA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
