#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'ASCII::Validate' );
}

diag( "Testing ASCII::Validate $ASCII::Validate::VERSION, Perl $], $^X" );
