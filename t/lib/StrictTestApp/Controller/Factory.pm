package StrictTestApp::Controller::Factory;
use strict;
use warnings;

use base 'StrictTestApp::BaseController::Adaptor';

__PACKAGE__->config( model => 'Factory' );

sub foo :Local {
    my ($self, $c) = @_;
    $c->res->body($c->model($self->model, foo => 'factory')->foo);
}

1;
