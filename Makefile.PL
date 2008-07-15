use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'ASCII::Validate',
    AUTHOR              => 'Sriram Rajagopalan <rjsri@cpan.org>',
    VERSION_FROM        => 'lib/ASCII/Validate.pm',
    ABSTRACT_FROM       => 'lib/ASCII/Validate.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'ASCII-Validate-*' },
);
