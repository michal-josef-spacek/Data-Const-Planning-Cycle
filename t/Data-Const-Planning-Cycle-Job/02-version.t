use strict;
use warnings;

use Data::Const::Planning::Cycle::Job;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Const::Planning::Cycle::Job::VERSION, 0.03, 'Version.');
