use inc::Module::Install;

name 'DBIx-Rico';
author 'Kentaro Kuribayashi, <kentarok@cpan.org>',
license 'MIT';
all_from 'lib/DBIx/Rico.pm';
requires $_ for qw(
);
build_requires $_ for qw(
    Test::More
    Test::Class
    Module::Collect
    Class::Accessor::Lvalue::Fast
    Filter::Util::Call
);
author_tests 'xt';
auto_include_deps;
WriteAll;
