package Test::DBIx::Rico::SQL;
use DBIx::Rico::Test;
use DBIx::Rico::SQL;

sub constructor : Tests {
    my $self = shift;
    desc 'DBIx::Rico::SQL, when new() is called,' => sub {
        it 'should live.';
        lives_ok { DBIx::Rico::SQL->new } spec;

        it 'returns new DBIx::Rico::SQL object.';
        isa_ok (DBIx::Rico::SQL->new, 'DBIx::Rico::SQL', spec);
    };
}

__PACKAGE__->runtests;

1;
