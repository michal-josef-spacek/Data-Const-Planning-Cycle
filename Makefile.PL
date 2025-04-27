use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Constant data for Data::Bus.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.05;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Data-Const-Bus';
perl_version 5.006002;
readme_from 'Bus.pm';
recursive_author_tests('xt');
requires 'Class::Utils' => 0.03;
requires 'Data::Bus' => 0.04;
requires 'Data::Bus::Term' => 0.04;
requires 'Data::Bus::Order' => 0.04;
requires 'Data::Const' => 0;
requires 'Data::ExternalId' => 0;
requires 'Data::Person' => 0;
requires 'DateTime' => 0;
requires 'Unicode::UTF8' => 0;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/Data-Const-Bus/issues';
resources 'homepage' => 'https://github.com/michal-josef-spacek/Data-Const-Bus';
resources 'repository' => 'git://github.com/michal-josef-spacek/Data-Const-Bus';
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
