package StrictTestApp::Model::InnerPackage;
use strict;
use warnings;

use StrictTestApp::Backend::InnerPackage;

use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( class => 'StrictTestApp::Backend::InnerPackage::Inner' );

1;
