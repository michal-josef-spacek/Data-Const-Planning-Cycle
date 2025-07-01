use strict;
use warnings;

use Data::Const::Planning::Cycle;
use Test::More 'tests' => 33;
use Test::NoWarnings;

# Test.
my $obj = Data::Const::Planning::Cycle->new;
my $ret_hr = $obj->data;
is(scalar @{$ret_hr->{'cycles'}}, 4, 'Count of cycles (4).');
foreach my $i (0 .. 3) {
	isa_ok($ret_hr->{'cycles'}->[$i], 'Data::Planning::Cycle');
}
is(scalar @{$ret_hr->{'items'}}, 26, 'Count of items (26).');
foreach my $i (0 .. 25) {
	isa_ok($ret_hr->{'items'}->[$i], 'Data::Planning::Cycle::Item');
}
