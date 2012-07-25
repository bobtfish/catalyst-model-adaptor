package StrictTestApp::Controller::Adaptor;
use strict;
use warnings;

use base 'StrictTestApp::BaseController::Adaptor';

__PACKAGE__->config( model => 'SomeClass' );

1;
