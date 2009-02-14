use inc::Module::Install;

name 'DBIx-Rico';
author 'Kentaro Kuribayashi, <kentarok@cpan.org>',
license 'MIT';
all_from 'lib/DBIx/Rico.pm';

requires $_ for (qw/ /);

build_requires 'Test::More';
author_tests 'xt';
auto_include_deps;
WriteAll;
