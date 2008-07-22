use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Sub::Called',
    AUTHOR              => 'Curtis "Ovid" Poe <ovid@cpan.org>',
    VERSION_FROM        => 'lib/Sub/Called.pm',
    ABSTRACT_FROM       => 'lib/Sub/Called.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Sub-Called-*' },
);
