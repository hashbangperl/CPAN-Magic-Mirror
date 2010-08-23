package CPAN::MagicMirror::Controller::Modules;
use strict;
use warnings;

=head1 NAME

CPAN::MagicMirror::Controller::Modules - Catalyst controller for modules 

=head1 DESCRIPTION

Catalyst controller for modules

=cut

use File::Path qw(make_path);
use Archive::Any;
use Module::Info;
use CPAN::DistnameInfo;

use parent 'Catalyst::Controller';

my $module_file_path = 'modules';

=head2 index

action handling /modules

forwards to list action

=cut

sub index :Path :Args(0) {
   list(@_);
}

=head2 list

=cut

sub list : Local {
    my ($self, $c) = @_;

    # populate with list of module
    # force to array(ref) to avoid problems with TT context,
    # allow re-use of template for created arrays
    my $page_no = $c->request->param('page') || 1;
    my $modules = $c->model('DB::Module')->search({});
    warn "modules : $modules\n";
    my $module_list = $modules->page($page_no);
    warn "module list : $module_list\n";
    $c->stash->{module_list} = [ $module_list->all ];
    $c->stash->{pager} = $module_list->pager;
    # specify template
    $c->stash->{template} = 'modules/list.tt';

    return;
}


=head2 search

=cut

sub search : Local {
    my ($self, $c) = @_;

    # populate with list of module
    # force to array(ref) to avoid problems with TT context,
    # allow re-use of template for created arrays
    my $conditions = {};
    my $keywords = $c->request->param('keywords');
    my @keywords = split(/\s+/,$keywords);
    if (@keywords) {
	$conditions = { -or => [ map ( { module_name => { like => "%${_}%" } }, @keywords) ] };
	$c->stash->{message} = 'searched for ' . join(', ', @keywords);
    }
    my $page_no = $c->request->param('page') || 1;
    my $modules = $c->model('DB::Module')->search($conditions);
    warn "modules : $modules\n";
    my $module_list = $modules->page($page_no);
    warn "module list : $module_list\n";
    $c->stash->{module_list} = [ $module_list->all ];
    $c->stash->{pager} = $module_list->pager;
    
    # specify template
    $c->stash->{template} = 'modules/list.tt';

    return;
}

=head2 upload

handles uploading new clothing

maps to /clothing/upload

=cut

sub upload : Local {
    my ($self, $c) = @_;
    $c->stash->{template} = 'upload.html';
    # check for form submission
    if ( $c->request->parameters->{form_submit} eq 'yes' ) {

	# check for uploaded data
	if ( my $upload = $c->request->upload('module_file') ) {
	    my $filename = $upload->filename;

	    my $author_id = $c->request->parameters->{author_id};
	    my $module = $c->model('DB::Module')->create({author_id => $author_id, module_name => 'xxx', module_version=>0});
	    my $destdir = $module_file_path . '/' . $module->id;
	    my $uploaded_filename = "$destdir/$filename";

	    unless ( $upload->link_to($uploaded_filename) || $upload->copy_to($uploaded_filename) ) {
		die( "Failed to copy ’$filename’ to ’$uploaded_filename’: $!" );
	    }

	    my $archive;

	    eval {
		$archive=Archive::Any->new($uploaded_filename);
		$archive->extract($destdir);
	    };

	    if (my $error=$@) {
		$c->stash->{message} = "error unpacking/extracting file $uploaded_filename : $@";
		return;
	    }
	    my $d = CPAN::DistnameInfo->new($filename);
	    (my $dist_file = $d->dist) =~ s|\-|\/|g;      # "CPAN-DistnameInfo"
	    my $mod = Module::Info->new_from_file("${dist_file}.pm");
	    my $name    = $mod->name;
	    my $version = $mod->version;
	    my $dir     = $mod->inc_dir;
	    my $file    = $mod->file;
	    my $is_core = $mod->is_core;

	}
    }
}


=head1 AUTHOR

Aaron Trevena

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut


1;
