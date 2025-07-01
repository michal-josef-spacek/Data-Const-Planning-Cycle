package Data::Const::Planning::Cycle::Czech::Woman;

use base qw(Data::Const);
use strict;
use warnings;

use Class::Utils qw(set_params);
use Data::Planning::Cycle;
use Data::Planning::Cycle::Item;
use DateTime;
use Mo::utils::Hash qw(check_hash);
use Unicode::UTF8 qw(decode_utf8);

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

	my $panna = Data::Planning::Cycle::Item->new(
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Panna',
		'state' => 'done',
	);
	my $matka = Data::Planning::Cycle::Item->new(
		'id' => $self->{'cb_item_id'}->($self),
		'name' => 'Matka',
		'state' => 'done',
	);
	my $carodejka = Data::Planning::Cycle::Item->new(
		'id' => $self->{'cb_item_id'}->($self),
		'name' => decode_utf8('Čarodějka'),
		'state' => 'progress',
	);
	my $starena = Data::Planning::Cycle::Item->new(
		'id' => $self->{'cb_item_id'}->($self),
		'name' => decode_utf8('Stařena'),
		'state' => 'new',
	);

	my $woman = Data::Planning::Cycle->new(
		'dt_created' => DateTime->now,
		'description' => decode_utf8('Cyklické fáze ženy.'),
		'id' => $self->{'cb_cycle_id'}->($self),
		'items' => [$panna, $matka, $carodejka, $starena],
		'name' => decode_utf8('Žena'),
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
