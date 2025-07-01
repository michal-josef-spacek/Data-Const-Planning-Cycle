package Data::Const::Planning::Cycle::Season;

use base qw(Data::Const);
use strict;
use warnings;

use Class::Utils qw(set_params);
use Data::Planning::Cycle;
use Data::Planning::Cycle::Item;
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

#	my ($act_day, $act_month, $act_year) = (localtime())[3 .. 5];
#	my $act_month += 1;
#	my $act_year += 1900;
#	my $dt_act = DateTime->now;
#	my $dt_spring = DateTime->new(
#		'year' => $act_year,
#		'month' => 3,
#		'day' => 21,
#	);
#	my ($state_spring, $state_summer, $state_autumn, $state_winter) = ('new' x 4);
#	if (DateTime->compare($dt_act, $dt_spring) == -1) {
#	}
	my $spring = Data::Planning::Cycle::Item->new(
		'description' => 'Spring, also known as springtime, is one of the four temperate seasons, succeeding winter and preceding summer.',
		# TODO Something relalistic.
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Spring',
		# TODO Something relalistic.
		'state' => 'new',
	);
	my $summer = Data::Planning::Cycle::Item->new(
		'description' => 'Summer or summertime is the hottest and brightest of the four temperate seasons, occurring after spring and before autumn.',
		# TODO Something relalistic.
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Summer',
		# TODO Something relalistic.
		'state' => 'new',
	);
	my $autumn = Data::Planning::Cycle::Item->new(
		'description' => 'Autumn, also known as fall, is one of the four temperate seasons on Earth.',
		# TODO Something relalistic.
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Autumn',
		# TODO Something relalistic.
		'state' => 'new',
	);
	my $winter = Data::Planning::Cycle::Item->new(
		'description' => 'Winter is the coldest and darkest season of the year in temperate and polar climates. It occurs after autumn and before spring.',
		# TODO Something relalistic.
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Winter',
		# TODO Something relalistic.
		'state' => 'new',
	);

	my $season = Data::Planning::Cycle->new(
		'dt_created' => DateTime->now,
		'description' => "A season is a division of the year based on changes in weather, ecology, and the number of daylight hours in a given region. On Earth, seasons are the result of the axial parallelism of Earth's tilted orbit around the Sun",
		'id' => $self->{'cb_cycle_id'}->($self),
		'items' => [$spring, $summer, $autumn, $winter],
		'name' => 'Season',
	);

	if (! exists $self->{'output_struct'}->{'cycles'}) {
		$self->{'output_struct'}->{'cycles'} = [];
	}
	push @{$self->{'output_struct'}->{'cycles'}}, $season;
	if (! exists $self->{'output_struct'}->{'items'}) {
		$self->{'output_struct'}->{'items'} = [];
	}
	push @{$self->{'output_struct'}->{'items'}}, $spring, $summer, $autumn,
		$winter;

	return $self->{'output_struct'};
}

1;

__END__
