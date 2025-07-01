use strict;
use warnings;

use Data::Const::Planning::Cycle::Season;
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Test.
my $obj = Data::Const::Planning::Cycle::Season->new;
my $ret_hr = $obj->data;
isa_ok($ret_hr->{'cycles'}->[0], 'Data::Planning::Cycle');
isa_ok($ret_hr->{'items'}->[0], 'Data::Planning::Cycle::Item');
isa_ok($ret_hr->{'items'}->[1], 'Data::Planning::Cycle::Item');
isa_ok($ret_hr->{'items'}->[2], 'Data::Planning::Cycle::Item');
isa_ok($ret_hr->{'items'}->[3], 'Data::Planning::Cycle::Item');
