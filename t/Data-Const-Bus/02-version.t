use strict;
use warnings;

use Data::Const::Bus;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Const::Bus::VERSION, 0.01, 'Version.');
