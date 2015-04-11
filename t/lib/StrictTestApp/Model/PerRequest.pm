package StrictTestApp::Model::PerRequest;
use strict;
use warnings;

use base 'Catalyst::Model::Factory::PerRequest';

__PACKAGE__->config( class => 'StrictTestApp::Backend::SomeClass' );

1;
