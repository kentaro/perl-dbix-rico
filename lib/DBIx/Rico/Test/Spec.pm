package DBIx::Rico::Test::Spec;
use strict;
use warnings;
use Exporter;

our @EXPORT = qw(describe desc it spec);
our @ISA = qw(Exporter);

my $subject = '';
my $statement = '';

sub describe (@) {
    $subject = shift || '';
    $statement = '';
    shift->();
}

sub desc (@) { describe(@_) }
sub it ($)   { $statement = shift || '' }
sub spec (@) { join(" ", $subject, $statement) }

1;
