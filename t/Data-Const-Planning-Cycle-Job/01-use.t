use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Data::Const::Planning::Cycle::Job');
}

# Test.
require_ok('Data::Const::Planning::Cycle::Job');
