use strict;
use warnings;

use Plack::Request;

my $app = sub {
    my $value = Plack::Request->new($_[0])->query_parameters->{value};

    [
        200,
        [ 'Content-Type' => 'text/xml' ],
        [
            (defined $value && length $value)
            ? "<http_test><value>$value</value></http_test>"
            : '<http_test><error>no value specified</error></http_test>'
        ],
    ]
};
