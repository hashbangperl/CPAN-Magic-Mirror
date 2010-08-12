package CPAN::MagicMirror::Controller::Releases;
use strict;
use warnings;

=head1 NAME

CPAN::MagicMirror::Controller::Releases - Catalyst controller for releases 

=head1 DESCRIPTION

Catalyst controller for releases 

=cut

use CPAN::DistnameInfo;

use parent 'Catalyst::Controller';

=head2 index

action handling /releases

forwards to list action

=cut

sub index :Path :Args(0) {
   list(@_);
}

=head2 list

=cut

sub list : Local {
    my ($self, $c) = @_;

    # populate with list of release
    # force to array(ref) to avoid problems with TT context,
    # allow re-use of template for created arrays
    my $page_no = $c->request->param('page') || 1;
    my $releases = $c->model('DB::ReleaseCategory')->search({});
    warn "releases : $releases\n";
    my $release_list = $releases->page($page_no);
    warn "release list : $release_list\n";
    $c->stash->{release_list} = [ $release_list->all ];
    $c->stash->{pager} = $release_list->pager;
    
    # specify template
    $c->stash->{template} = 'releases/list.tt';

    return;
}

# /releases/categoryname/authors/id/G/GB/GBARR/CPAN-DistnameInfo-0.02.tar.gz
sub dist :Chained('by_name') :PathPart('authors/id') :Args(4) {
    my ($self, $c, $a, $b, $author_ident, $filename ) = @_;
    my $release = $c->stash->{this_release};
    my $d = CPAN::DistnameInfo->new($filename);
    (my $module_name = $d->dist) =~ s|\-|::|g;
    my $module_version   = $d->version;   # "0.02"
    my $module = $c->model('DB::Module')->search ({ module_name => $module_name, module_version => $module_version }, {join => {releases => $release->id}});
    my $download_filepath = $module_file_path . '/' . $module->id . '/' . $filename ;

    # set content type

    # redirect to static file
    # look at how done in Connected::CMS in thumbs model/controller

    return;
}

sub by_name : PathPart('releases') :Chained('/') :CaptureArgs(1) {
    my ($self, $c, $name) = @_;

    my ($this_release) = $c->model('DB::CategoryRelease')->search({category_name => $name} );
    $c->stash->{this_release} = $this_release;

    return;
    
}

=head1 AUTHOR

Aaron Trevena

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut


1;
