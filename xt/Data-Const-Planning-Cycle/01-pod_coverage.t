use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::Const::Planning::Cycle', 'Data::Const::Planning::Cycle is covered.');
