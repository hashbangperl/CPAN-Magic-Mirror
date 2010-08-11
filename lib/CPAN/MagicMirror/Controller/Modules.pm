package CPAN::MagicMirror::Controller::Modules;
use strict;
use warnings;

=head1 NAME

CPAN::MagicMirror::Controller::Modules - Catalyst controller for modules 

=head1 DESCRIPTION

Catalyst controller for modules 

=cut

use parent 'Catalyst::Controller';

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



=head1 AUTHOR

Aaron Trevena

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut


1;
