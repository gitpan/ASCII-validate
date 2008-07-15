package ASCII::Validate;

use warnings;
use strict;

=head1 NAME

ASCII::Validate

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

This module validates the content on ASCII files. Any binary characters in the file
will be reported as a error. In addition when preparing a text file, by mistake, if
the author performs a multiple key presses or have used any text markup tags without
any content, errors will be reported. This module will be useful for programmers
developing validation tools for XML publishing.

Perhaps a little code snippet.

    use ASCII::Validate;

    my $foo = ASCII::Validate->new();
    ...

=head1 EXPORT
chk_seq
chk_nonascii
chk_dummy
report

=head1 FUNCTIONS

sub chk_seq
{
	while($_ =~ /(.)\1\1\1/g){report("Character '$1' found repeating several times in the text.\nPossibility of a typographic error or a sequence of unintentional key press.",2)}
}

#To check for the presence of any non-ascii characters
sub chk_nonascii()
{
	while ($_ =~ /[^!-~\s]/g) {report ("Non-ASCII Character $& found in $ARGV[0].\nXML produced could be incorrect. Fix the error and re-run the conversion",1)};
}

#To check for dummy elements in the input file
sub chk_dummy
{
	if($_ =~ /<([^\/ >]+)( [^>]+)?><\/\1>/gs) {report("Element with no content '$&' found in $ARGV[0].\nRemove if this is unnecessary and re-run the conversion",2)};
}

#For reporting errors
sub report
{
	if ($_[1]==1)
	{
		print F3 "ERROR: Ln# $.: $_[0]\n**********\n\n";
		$ecount++;
	}
	if ($_[1]==2)
	{
		print F3 "WARNING: Ln# $.: $_[0]\n**********\n\n";
		$wcount++;
	}
	if ($_[1]==3)
	{
		print F3 "INFO: Ln# $.: $_[0]\n**********\n\n";
		$icount++;
	}
}

=head1 AUTHOR

Sriram Rajagopalan, C<< <rjsri at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-ascii-validate at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=ASCII-Validate>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc ASCII::Validate

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/ASCII-Validate>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/ASCII-Validate>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=ASCII-Validate>

=item * Search CPAN

L<http://search.cpan.org/dist/ASCII-Validate>

=back

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2008 Sriram Rajagopalan, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of ASCII::Validate
