package Data::Const::Planning::Cycle;

use base qw(Data::Const);
use strict;
use warnings;

use Class::Utils qw(set_params);
use Data::Const::Planning::Cycle::Season;
use DateTime;
use Mo::utils 0.06 qw(check_bool);
use Mo::utils::Hash qw(check_hash);

our $VERSION = 0.02;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Mode to present ids.
	$self->{'mode_id'} = 1;

	# Output structure.
	$self->{'output_struct'} = {};

	# Process parameters.
	set_params($self, @params);

	# Check 'mode_id'.
	check_bool($self, 'mode_id');

	# Check 'output_struct'.
	check_hash($self, 'output_struct');

	return $self;
}

sub data {
	my $self = shift;

	Data::Const::Planning::Cycle::Season->new(
		'output_struct' => $self->{'output_struct'},
	)->data;	

	return $self->{'output_struct'};
}

1;

__END__
