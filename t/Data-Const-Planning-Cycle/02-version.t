use strict;
use warnings;

use Data::Const::Planning::Cycle;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Const::Planning::Cycle::VERSION, 0.01, 'Version.');
