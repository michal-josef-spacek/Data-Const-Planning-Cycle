use strict;
use warnings;

use Data::Const::Planning::Cycle::Season;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Const::Planning::Cycle::Season::VERSION, 0.03, 'Version.');
