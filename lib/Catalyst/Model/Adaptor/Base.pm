package Catalyst::Model::Adaptor::Base;
use strict;
use warnings;

use Carp;
use MRO::Compat;

use base 'Catalyst::Model';

sub _load_adapted_class {
    my ($self) = @_;

    croak 'need class' unless $self->{class};
    my $adapted_class = $self->{class};
    Catalyst::Utils::ensure_class_loaded($adapted_class);

    return $adapted_class;
}

sub _create_instance {
    my ($self, $app, $rest) = @_;

    my $constructor = $self->{constructor} || 'new';
    my $arg = $self->prepare_arguments($app, $rest);
    $self->_handle_catalystmodel_args($arg);
    my $adapted_class = $self->{class};

    return $adapted_class->$constructor($self->mangle_arguments($arg));
}

sub _handle_catalystmodel_args {
    my ($self, $arg) = @_;
    my $keep_flag = $arg->{keep_catalystmodel_args}||0;
    delete $arg->{keep_catalystmodel_args} ;
    delete @{$arg}{'catalyst_component_name','class','args'} unless $keep_flag;
}

sub prepare_arguments {
    my ($self, $app, $arg) = @_;
    return exists $self->{args} ? {
        %{$self->{args}},
        %$arg,
    } : $arg;
}

sub mangle_arguments {
    my ($self, $args) = @_;
    return $args;
}

1;

__END__

=head1 NAME

Catalyst::Model::Adaptor::Base - internal base class for Catalyst::Model::Adaptor and friends.

=head1 SYNOPSIS

    # There are no user-serviceable parts in here.

=head1 METHODS

=head2 _load_adapted_class

Load the adapted class

=head2 _create_instance

Instantiate the adapted class

=head2 _handle_catalystmodel_args

Remove arguments which are default in Catalyst::Model but break things if our class
uses MooseX::StrictConstructor

=head2 prepare_arguments

Prepare the arguments

=head2 mangle_arguments

Make the arguments amenable to the adapted class

=head1 SEE ALSO

L<Catalyst::Model::Adaptor>

L<Catalyst::Model::Factory>

L<Catalyst::Model::Factory::PerRequest>

