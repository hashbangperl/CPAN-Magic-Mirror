package CPAN::MagicMirror::DB::Result::LocalModification;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

CPAN::MagicMirror::DB::Result::LocalModification

=cut

__PACKAGE__->table("local_modifications");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 module_id

  data_type: 'integer'
  is_nullable: 0

=head2 filename

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 modification_type

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 modification_description

  data_type: 'text'
  is_nullable: 1

=head2 modification_date

  data_type: 'datetime'
  is_nullable: 1

=head2 modification_author

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "module_id",
  { data_type => "integer", is_nullable => 0 },
  "filename",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "modification_type",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "modification_description",
  { data_type => "text", is_nullable => 1 },
  "modification_date",
  { data_type => "datetime", is_nullable => 1 },
  "modification_author",
  { data_type => "varchar", is_nullable => 1, size => 128 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-07-06 19:50:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BaqspsyXtAWS+Werx6NPxw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
