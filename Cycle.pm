package Data::Const::Planning::Cycle;

use base qw(Data::Const);
use strict;
use warnings;

use Class::Utils qw(set_params);
use Data::Const::Planning::Cycle::Season;
use DateTime;
use Mo::utils::Hash qw(check_hash);

our $VERSION = 0.02;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Cycle id.
	$self->{'cycle_id'} = 1;
	$self->{'cb_cycle_id'} = sub {
		return $self->{'cycle_id'}++;
	};

	# Item id.
	$self->{'item_id'} = 1;
	$self->{'cb_item_id'} = sub {
		return $self->{'item_id'}++;
	};

	# Output structure.
	$self->{'output_struct'} = {};

	# Process parameters.
	set_params($self, @params);

	# Check 'output_struct'.
	check_hash($self, 'output_struct');

	return $self;
}

sub data {
	my $self = shift;

	Data::Const::Planning::Cycle::Season->new(
		'cb_cycle_id' => $self->{'cb_cycle_id'},
		'cb_item_id' => $self->{'cb_item_id'},
		'cycle_id' => $self->{'cycle_id'},
		'item_id' => $self->{'item_id'},
		'output_struct' => $self->{'output_struct'},
	)->data;

	return $self->{'output_struct'};
}

1;

__END__
