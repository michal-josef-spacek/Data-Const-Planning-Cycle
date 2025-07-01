use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Constant data for Data::Planning::Cycle.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.05;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Data-Const-Planning-Cycle';
perl_version 5.006002;
readme_from 'Cycle.pm';
recursive_author_tests('xt');
requires 'Class::Utils' => 0.03;
requires 'Data::Planning::Cycle' => 0;
requires 'Data::Planning::Cycle::Item' => 0;
requires 'DateTime' => 0;
requires 'Mo::utils::Hash' => 0;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/Data-Const-Planning-Cycle/issues';
resources 'homepage' => 'https://github.com/michal-josef-spacek/Data-Const-Planning-Cycle';
resources 'repository' => 'git://github.com/michal-josef-spacek/Data-Const-Planning-Cycle';
test_requires 'English' => 0;
test_requires 'Error::Pure::Utils' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.02';

# Run.
WriteAll();
