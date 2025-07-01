use strict;
use warnings;

use Data::Const::Planning::Cycle;
use Test::More 'tests' => 11;
use Test::NoWarnings;

# Test.
my $obj = Data::Const::Planning::Cycle->new;
my $ret_hr = $obj->data;
foreach my $i (0 .. 1) {
	isa_ok($ret_hr->{'cycles'}->[$i], 'Data::Planning::Cycle');
}
foreach my $i (0 .. 7) {
	isa_ok($ret_hr->{'items'}->[$i], 'Data::Planning::Cycle::Item');
}
