package Data::Const::Bus;

use strict;
use warnings;

use Class::Utils qw(set_params);
use Data::Bus;
use Data::Bus::Term;
use Data::Bus::Order;
use DateTime;
use Unicode::UTF8 qw(decode_utf8);

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Mode to present ids.
	$self->{'mode_id'} = 1;

	# Mode to date of payment.
	$self->{'mode_date_of_payment'} = 0;

	# Process parameters.
	set_params($self, @params);

	return $self;
}

sub data {
	my $self = shift;

	my $bus = Data::Bus->new(
		$self->{'mode_id'} ? ('id' => 1) : (),
		'name' => 'Karosa B 732',
		'seats_count' => 31,
	);

	my $term = Data::Bus::Term->new(
		'bus' => $bus,
		'datetime_from' => DateTime->new(
			'year' => 2025,
			'month' => 4,
			'day' => 25,
			'hour' => 12,
		),
		'datetime_to' => DateTime->new(
			'year' => 2025,
			'month' => 4,
			'day' => 25,
			'hour' => 16,
		),
		$self->{'mode_id'} ? ('id' => 1) : (),
		'seats_count' => 12,
	);

	my $order = Data::Bus::Order->new(
		'date_of_order' => DateTime->new(
			'year' => 2025,
			'month' => 4,
			'day' => 24,
			'hour' => 12,
			'minute' => 12,
			'second' => 34,
		),
		$self->{'mode_date_of_payment'} ? (
			'date_of_payment' => DateTime->new(
				'year' => 2025,
				'month' => 4,
				'day' => 24,
				'hour' => 15,
				'minute' => 11,
				'second' => 45,
			),
		) : (),
		'email' => 'skim@cpan.org',
		$self->{'mode_id'} ? ('id' => 1) : (),
		'person' => decode_utf8('Michal Josef Spacek'),
		'phone' => '+420777623160',
		'term' => $term,
		'seats_count' => 4,
	);

	my $ret_hr = {
		'buses' => [$bus],
		'terms' => [$term],
		'orders' => [$order],
	};

	return $ret_hr;
}

1;

__END__
