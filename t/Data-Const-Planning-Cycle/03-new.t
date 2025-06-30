use strict;
use warnings;

use Data::Const::Planning::Cycle;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Const::Planning::Cycle->new;
isa_ok($obj, 'Data::Const::Planning::Cycle');

# Test.
eval {
	Data::Const::Planning::Cycle->new(
		'mode_id' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'mode_id' must be a bool (0/1).\n",
	"Parameter 'mode_id' must be a bool (0/1) (bad).");
clean();
