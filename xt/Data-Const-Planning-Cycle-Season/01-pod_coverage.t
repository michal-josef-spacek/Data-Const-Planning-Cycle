use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::Const::Planning::Cycle::Season', 'Data::Const::Planning::Cycle::Season is covered.');
