package DBIx::Rico::Test;
use strict;
use warnings;
use Filter::Util::Call;
use base qw(Test::Class Class::Accessor::Lvalue::Fast);

__PACKAGE__->mk_accessors(qw(module));

my @goodies = qw(
    strict
    warnings
    Test::More
    Test::Exception
    DBIx::Rico::Test::Spec
);

sub import {
    my $class  = shift;
    my $caller = caller;
    unless ($caller eq $class) {
        no strict 'refs';
        push @{$caller . ":\:ISA"}, $class;
    }
    $class->use_goodies;
}

sub use_goodies {
    my $class = shift;
    my $done  = 0;
    Filter::Util::Call::filter_add(
        sub {
            return 0 if $done;
            my ($data, $end) = ('', '');
            while (my $status = Filter::Util::Call::filter_read()) {
                return $status if $status < 0;
                if (/^__(?:END|DATA)__\r?$/) {
                    $end = $_;
                    last;
                }
                $data .= $_;
                $_ = '';
            }
            my $use_statements = (join qq{\n}, (map { qq{use $_;} } @goodies)) . qq{\n};
            $_ = $use_statements . $data . $end;
            $done = 1;
        }
    );
}

1;
