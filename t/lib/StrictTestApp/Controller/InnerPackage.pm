package StrictTestApp::Controller::InnerPackage;
use strict;
use warnings;

use base 'StrictTestApp::BaseController::Adaptor';

__PACKAGE__->config( model => 'InnerPackage' );

1;
