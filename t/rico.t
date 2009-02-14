package Test::DBIx::Rico;
use DBIx::Rico::Test;
use DBIx::Rico;

sub constructor : Tests {
    my $self = shift;
    desc 'DBIx::Rico, when new() is called,' => sub {
        it 'should live.';
        lives_ok { DBIx::Rico->new } spec;

        it 'returns new DBIx::Rico object.';
        isa_ok (DBIx::Rico->new, 'DBIx::Rico', spec);
    };
}

__PACKAGE__->runtests;

1;
