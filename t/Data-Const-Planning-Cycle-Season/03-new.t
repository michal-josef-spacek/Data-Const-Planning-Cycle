use strict;
use warnings;

use Data::Const::Planning::Cycle::Season;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Const::Planning::Cycle::Season->new;
isa_ok($obj, 'Data::Const::Planning::Cycle::Season');

# Test.
eval {
	Data::Const::Planning::Cycle::Season->new(
		'output_struct' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'output_struct' isn't hash reference.\n",
	"Parameter 'output_struct' isn't hash reference (bad).");
clean();
