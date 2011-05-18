#!/bin/sh

PERL5LIB="$PWD/perl5/lib/perl5"
PATH="$PWD/perl5/bin:$PATH"

perl -v | grep 'This is perl'
perl -nlE '$v = eval "require $_; $_->VERSION"; say $_, " ", $v // "not installed"' <<EOF
HTTP::Parser::XS
Starman
Plack
EOF

exec starman --port 8080 "$@" ./app.psgi
