#!/bin/sh

perldir="$PWD/perl5"
[ -d $perldir ] || mkdir $perldir
export PERL5LIB=$perldir/lib/perl5
PATH="$perldir/bin:$PATH"
export PERL_CPANM_OPT="-l $perldir"

[ -x "$perldir/bin/cpanm" ] || curl -L http://cpanmin.us | perl - --self-upgrade

exec cpanm App::cpanminus Plack HTTP::Parser::XS AnyEvent Twiggy Feersum Starman 

