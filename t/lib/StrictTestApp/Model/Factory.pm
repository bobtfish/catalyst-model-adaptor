package StrictTestApp::Model::Factory;
use strict;
use warnings;

use base 'Catalyst::Model::Factory';

__PACKAGE__->config( class => 'StrictTestApp::Backend::SomeClass' );

1;
