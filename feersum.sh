#!/bin/sh

PERL5LIB="$PWD/perl5/lib/perl5"
PATH="$PWD/perl5/bin:$PATH"

perl -v | grep 'This is perl'
perl -nlE '$v = eval "require $_; $_->VERSION"; say $_, " ", $v // "not installed"' <<EOF
AnyEvent
Feersum
HTTP::Parser::XS
Plack
EOF

exec plackup -s Feersum -E production --port 8080 --pre-fork=32 "$@" ./app.psgi
