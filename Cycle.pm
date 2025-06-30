package Data::Const::Planning::Cycle;

use base qw(Data::Const);
use strict;
use warnings;

use Class::Utils qw(set_params);
use Data::Planning::Cycle;
use Data::Planning::Cycle::Item;
use DateTime;
use Mo::utils 0.06 qw(check_bool);

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Mode to present ids.
	$self->{'mode_id'} = 1;

	# Process parameters.
	set_params($self, @params);

	# Check 'mode_id'.
	check_bool($self, 'mode_id');

	return $self;
}

sub data {
	my $self = shift;

	my $spring = Data::Planning::Cycle::Item->new(
		'description' => 'Spring, also known as springtime, is one of the four temperate seasons, succeeding winter and preceding summer.',
		# TODO Something relalistic.
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		$self->{'mode_id'} ? ('id' => 1) : (),
		'name' => 'Spring',
		# TODO Something relalistic.
		'state' => 'new',
	);
	my $summer = Data::Planning::Cycle::Item->new(
		'description' => 'Summer or summertime is the hottest and brightest of the four temperate seasons, occurring after spring and before autumn.',
		# TODO Something relalistic.
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		$self->{'mode_id'} ? ('id' => 2) : (),
		'name' => 'Summer',
		# TODO Something relalistic.
		'state' => 'new',
	);
	my $autumn = Data::Planning::Cycle::Item->new(
		'description' => 'Autumn, also known as fall, is one of the four temperate seasons on Earth.',
		# TODO Something relalistic.
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		$self->{'mode_id'} ? ('id' => 3) : (),
		'name' => 'Autumn',
		# TODO Something relalistic.
		'state' => 'new',
	);
	my $winter = Data::Planning::Cycle::Item->new(
		'description' => 'Winter is the coldest and darkest season of the year in temperate and polar climates. It occurs after autumn and before spring.',
		# TODO Something relalistic.
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		$self->{'mode_id'} ? ('id' => 4) : (),
		'name' => 'Winter',
		# TODO Something relalistic.
		'state' => 'new',
	);

	my $season = Data::Planning::Cycle->new(
		'dt_created' => DateTime->now,
		'description' => "A season is a division of the year based on changes in weather, ecology, and the number of daylight hours in a given region. On Earth, seasons are the result of the axial parallelism of Earth's tilted orbit around the Sun",
		$self->{'mode_id'} ? ('id' => 1) : (),
		'items' => [$spring, $summer, $autumn, $winter],
		'name' => 'Season',
	);

	my $ret_hr = {
		'cycles' => [$season],
		'items' => [$spring, $summer, $autumn, $winter],
	};

	return $ret_hr;
}

1;

__END__
