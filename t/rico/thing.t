package Test::DBIx::Rico::Thing;
use DBIx::Rico::Test;
use DBIx::Rico::Thing;

sub constructor : Tests {
    my $self = shift;
    desc 'DBIx::Rico::Thing, when new()
 is called,' => sub {
        it 'should live.';
        lives_ok { DBIx::Rico::Thing->new } spec;

        it 'returns new DBIx::Rico::Thing object.';
        isa_ok (DBIx::Rico::Thing->new, 'DBIx::Rico::Thing', spec);
    };
}

__PACKAGE__->runtests;

1;
