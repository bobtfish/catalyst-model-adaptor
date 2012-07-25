package StrictTestApp::Controller::PerRequest;
use strict;
use warnings;

use base 'StrictTestApp::BaseController::Adaptor';

__PACKAGE__->config( model => 'PerRequest' );

sub foo :Local {
    my ($self, $c) = @_;
    $c->res->body($c->model($self->model, { foo => 'perrequest' })->foo);
}

1;
