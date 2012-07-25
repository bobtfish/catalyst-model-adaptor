package StrictTestApp::Backend::InnerPackage;

sub foo { 42 }

package StrictTestApp::Backend::InnerPackage::Inner;

use Moose;
use MooseX::StrictConstructor;

has 'okay' => (
  is => 'ro',
  default => 'Alright!',
);

no Moose;
__PACKAGE__->meta->make_immutable;
