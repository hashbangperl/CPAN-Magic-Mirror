package CPAN::MagicMirror::DB::Result::Module;

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
  "id" => { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "module_name" => { data_type => "varchar", is_nullable => 0, size => 255 },
  "module_version" => { data_type => "varchar", is_nullable => 0, size => 64 },
  "module_version_numeric" => { data_type => "float", is_nullable => 1, size => [6, 6] },
  "author_id" => { data_type => "integer", is_nullable => 0 },
  "module_derived_from" => { data_type => "integer", default_value => 0, is_nullable => 1 },
  "module_is_third_party" => { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "module_is_core" =>  { data_type => "float", default_value => "0.00", is_nullable => 1, size => [2, 2], },
  "module_is_bundle" => { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "module_requires_perl_version" => { data_type => "float", default_value => "0.00", is_nullable => 1, size => [2, 2], },
  "module_updated" => { data_type => "datetime", is_nullable => 1 },
  "module_checksum" => { data_type => "text", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 module_tags

Type: has_many

Related object: L<CPAN::MagicMirror::DB::Result::TaggedModule>

=cut

__PACKAGE__->has_many(
  "module_tags",
  "CPAN::MagicMirror::DB::Result::TaggedModule",
  { "foreign.module_id" => "self.id" },
);


__PACKAGE__->belongs_to(
  "author" => "CPAN::MagicMirror::DB::Result::Author",
    { id => "author_id" },
    );


=head2 tags

Many to many relation to tags

=cut

__PACKAGE__->many_to_many(
			  tags => 'module_tags', 'tag'
			 );


=head2 module_categories

Type: has_many

Related object: L<CPAN::MagicMirror::DB::Result::CategoryModule>

=cut

__PACKAGE__->has_many(
  "module_categories",
  "CPAN::MagicMirror::DB::Result::CategoryModule",
  { "foreign.module_id" => "self.id" },
);


=head2 categories

Many to many relation to categories

=cut

__PACKAGE__->many_to_many(
			  categories => 'module_categories', 'category'
			 );



=head1 METHODS

=head2 dist_filename

WebDAO-1.05.tar.gz

=cut

sub dist_filename {
    my $row = shift;
    (my $filename = $row->module_name) =~ s/\:+/-/g;
    $filename .= '-' . $row->module_version . '.tgz';
    return $filename;
}

1;
