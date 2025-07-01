package Data::Const::Planning::Cycle::Job;

use base qw(Data::Const);
use strict;
use warnings;

use Class::Utils qw(set_params);
use Data::Planning::Cycle;
use Data::Planning::Cycle::Item;
use DateTime;
use Mo::utils::Hash qw(check_hash);

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

	# TODO Real dates.
	my $prep = Data::Planning::Cycle::Item->new(
		'description' => 'Prepare all things needed for the job.',
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Preparation',
		'state' => 'done',
	);
	my $part1 = Data::Planning::Cycle::Item->new(
		'description' => 'First part of job.',
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Part one',
		'state' => 'done',
	);
	my $part2 = Data::Planning::Cycle::Item->new(
		'description' => 'Second part of job.',
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Part two',
		'state' => 'rejected',
	);
	my $part3 = Data::Planning::Cycle::Item->new(
		'description' => 'Third part of job.',
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Part three',
		'state' => 'progress',
	);
	my $part4 = Data::Planning::Cycle::Item->new(
		'description' => 'Fourth part of job.',
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Part four',
		'state' => 'new',
	);
	my $finish = Data::Planning::Cycle::Item->new(
		'description' => 'Finish job process.',
		'dt_changed' => DateTime->now,
		'dt_created' => DateTime->now,
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Finishing',
		'state' => 'new',
	);

	my $job = Data::Planning::Cycle->new(
		'dt_created' => DateTime->now,
		'description' => 'Job workflow.',
		'id' => $self->{'cb_cycle_id'}->($self),
		'items' => [$prep, $part1, $part2, $part3, $part4, $finish],
		'name' => 'Job',
	);

	if (! exists $self->{'output_struct'}->{'cycles'}) {
		$self->{'output_struct'}->{'cycles'} = [];
	}
	push @{$self->{'output_struct'}->{'cycles'}}, $job;
	if (! exists $self->{'output_struct'}->{'items'}) {
		$self->{'output_struct'}->{'items'} = [];
	}
	push @{$self->{'output_struct'}->{'items'}}, $prep, $part1, $part2,
		$part3, $part4, $finish;

	return $self->{'output_struct'};
}

1;

__END__
