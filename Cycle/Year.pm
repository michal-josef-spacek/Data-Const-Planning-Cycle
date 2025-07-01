package Data::Const::Planning::Cycle::Year;

use base qw(Data::Const);
use strict;
use warnings;

use Class::Utils qw(set_params);
use Data::Planning::Cycle;
use Data::Planning::Cycle::Item;
use DateTime;
use Mo::utils::Hash qw(check_hash);
use Readonly;

Readonly::Array our @MONTH_NAMES => qw(January February March April May June July August September October November December);

our $VERSION = 0.03;

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

	my $act_month = (localtime())[4] + 1;
	my $act_year = (localtime())[5] + 1900;

	my $dt_created = DateTime->new(
		'day' => 1,
		'month' => 1,
		'year' => $act_year,
	);

	my @items;
	foreach my $month (1 .. 12) {

		my ($state, $dt_changed);
		if ($month == $act_month) {
			$state = 'progress';
			$dt_changed = DateTime->new(
				'day' => 1,
				'month' => $act_month,
				'year' => $act_year,
			);
		} elsif ($month > $act_month) {
			$state = 'new';
			$dt_changed = $dt_created;
		} else {
			$state = 'done';
			$dt_changed = DateTime->new(
				'day' => 1,
				'month' => $month,
				'year' => $act_year,
			);
			$dt_changed = $dt_changed->add('months' => 1)->subtract('days' => 1);
		}
		
		push @items, Data::Planning::Cycle::Item->new(
			'dt_changed' => $dt_changed,
			'dt_created' => $dt_created,
			'id' => $self->{'cb_item_id'}->($self),
			'name' => $MONTH_NAMES[$month - 1],
			'state' => $state,
		);
	}

	my $year = Data::Planning::Cycle->new(
		'dt_created' => DateTime->now,
		'description' => 'Job workflow.',
		'id' => $self->{'cb_cycle_id'}->($self),
		'items' => [@items],
		'name' => 'Year',
	);

	if (! exists $self->{'output_struct'}->{'cycles'}) {
		$self->{'output_struct'}->{'cycles'} = [];
	}
	push @{$self->{'output_struct'}->{'cycles'}}, $year;
	if (! exists $self->{'output_struct'}->{'items'}) {
		$self->{'output_struct'}->{'items'} = [];
	}
	push @{$self->{'output_struct'}->{'items'}}, @items;

	return $self->{'output_struct'};
}

1;

__END__
