package CPAN::MagicMirror::DB::Result::CategoryModule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

CPAN::MagicMirror::DB::Result::CategoryModule

=cut

__PACKAGE__->table("category_modules");

=head1 ACCESSORS

=head2 module_id

  data_type: 'integer'
  is_nullable: 0

=head2 category_id

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "module_id",
  { data_type => "integer", is_nullable => 0 },
  "category_id",
  { data_type => "integer", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("module_id", "category_id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-08-11 18:48:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:w7UjmNkTROtYp5t6NGk0qw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
