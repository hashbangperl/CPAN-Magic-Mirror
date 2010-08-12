package CPAN::MagicMirror::DB::Result::ReleaseCategory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

CPAN::MagicMirror::DB::Result::ReleaseCategory

=cut

__PACKAGE__->table("release_category");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 category_name

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 category_description

  data_type: 'text'
  is_nullable: 1

=head2 category_created

  data_type: 'datetime'
  is_nullable: 1

=head2 category_updated

  data_type: 'datetime'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "category_name",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "category_description",
  { data_type => "text", is_nullable => 1 },
  "category_created",
  { data_type => "datetime", is_nullable => 1 },
  "category_updated",
  { data_type => "datetime", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-08-11 18:48:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QvnKkW+WD6rRgdPIOffwkQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
