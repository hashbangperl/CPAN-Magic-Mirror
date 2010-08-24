package CPAN::MagicMirror::DB::Result::CategoryModule;
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

"tag" => "CPAN::MagicMirror::DB::Result::Tag",    { id => "tag_id" },

=head1 RELATIONS

=head2 module

Type: belongs to 

Related object: L<CPAN::MagicMirror::DB::Result::Module>

=head2 category

Type: belongs to 

Related object: L<CPAN::MagicMirror::DB::Result::ReleaseCategory>

=cut

__PACKAGE__->belongs_to(module => "CPAN::MagicMirror::DB::Result::Module", { id => 'module_id' });
__PACKAGE__->belongs_to(category => "CPAN::MagicMirror::DB::Result::ReleaseCategory", { id => 'category_id' });



1;
