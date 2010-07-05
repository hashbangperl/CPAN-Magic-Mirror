package CPAN::MagicMirror::Model::CPANPLUS;
use strict;

use CPANPLUS::Backend;

my $cb      = CPANPLUS::Backend->new;
my $conf    = $cb->configure_object;

my $author  = $cb->author_tree('KANE');
my $mod     = $cb->module_tree('Some::Module');
my $mod     = $cb->parse_module( module => 'Some::Module' );

my @objs    = $cb->search(  type    => TYPE,
			    allow   => [...] );



1;
