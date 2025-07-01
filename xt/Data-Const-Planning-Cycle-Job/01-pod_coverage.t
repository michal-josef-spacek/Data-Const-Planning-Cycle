use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::Const::Planning::Cycle::Job', 'Data::Const::Planning::Cycle::Job is covered.');
