use strict;
use warnings;

use Data::Const::Planning::Cycle::Year;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Const::Planning::Cycle::Year::VERSION, 0.02, 'Version.');
