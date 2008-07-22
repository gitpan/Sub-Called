package Sub::Called;

use warnings;
use strict;

use base 'Exporter';
our @EXPORT_OK = qw(already_called not_called);

=head1 NAME

Sub::Called - Check if a sub has already been called

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    use Sub::Called 'already_called', 'not_called';

    sub user {
        unless (already_called) {   # only gets called once
            My::Fixtures::Users->load;
        }
        ...
    }

    sub schema {
        if ( not_called ) {
            # setup schema
        }
        else {
            return $schema;
        }
    }

=head1 EXPORT

=head2 C<already_called>

This function must be called from inside a subroutine.  It will return false
if the subroutine has not yet been called.  It will only return false once.

This subroutine is only exported on demand.

=head2 C<not_called>

This function must be called from inside a subroutine.  It returns the
opposite value of C<already_called>.  Aside from this, there is no difference.
You may find aesthetically more pleasing.

This subroutine is only exported on demand.

=head1 FUNCTIONS

=head2 C<already_called>

=cut

my %called;

sub already_called() {
    my ( $package, $filename, $line, $subroutine ) = caller(1);
    my $called = $called{$package}{$subroutine};
    $called{$package}{$subroutine} = 1;
    return $called;
}

=head2 C<not_called>

=cut

sub not_called() {
    my ( $package, $filename, $line, $subroutine ) = caller(1);
    my $called = $called{$package}{$subroutine};
    $called{$package}{$subroutine} = 1;
    return not $called;
}

=head1 AUTHOR

Curtis "Ovid" Poe, C<< <ovid at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-sub-called at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Sub-Called>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Sub::Called


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Sub-Called>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Sub-Called>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Sub-Called>

=item * Search CPAN

L<http://search.cpan.org/dist/Sub-Called>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2008 Curtis "Ovid" Poe, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Sub::Called
