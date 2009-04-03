package Algorithms::Numerical::Shuffle;

################################################################################
#
# $Author: abigail $
#
# $Date: 1998/04/23 17:45:12 $
#
# $Id: Shuffle.pm,v 1.1 1998/04/23 17:45:12 abigail Exp $
#
# $Log: Shuffle.pm,v $
# Revision 1.1  1998/04/23 17:45:12  abigail
# Initial revision
#
#
#
################################################################################

use strict;
use Exporter;


use vars qw /$VERSION @ISA @EXPORT @EXPORT_OK/;

@ISA       = qw /Exporter/;
@EXPORT    = qw //;
@EXPORT_OK = qw /shuffle/;

($VERSION) = '$Revision: 1.1 $' =~ /(\d+\.\d+)/;

sub shuffle {
    my $array = @_ == 1 && ref $_ [0] eq 'ARRAY' ? shift : [@_];
    for (my $i = @$array; -- $i;) {
        my $r = int rand ($i + 1);
       ($array -> [$i], $array -> [$r]) = ($array -> [$r], $array -> [$i]);
    }
    wantarray ? @$array : $array;
}


__END__

=head1 NAME

Algorithms::Numerical::Shuffle - Shuffle a list.

=head1 SYNOPSIS

    use Algorithms::Numerical::Shuffle qw /shuffle/;

    @shuffled = shuffle (1, 2, 3, 4, 5, 6, 7);

    $in_situ = [qw /one two three four five six/];
    shuffle $in_situ;

=head1 DESCRIPTION

C<shuffle> performs a one pass, fair shuffle on a list. If the list is
passed as a reference to an array, the shuffling is done in situ.

The subroutine returns the list in list context, and a reference to
the list in scalar context.

=head1 COMPLEXITY

The running time of the algorithm is linear in the size of the list.
For an in situ shuffle, the memory overhead is constant; otherwise,
linear extra memory is used.

=head1 LITERATURE

The algorithm used is discussed by Knuth [3]. It was first published
by Fisher and Yates [2], and later by Durstenfeld [1].

=head1 CAVEAT

Salfi [4] points to a big caveat. If the outcome of a random generator
is solely based on the value of the previous outcome, like a linear
congruential method, then the outcome of a shuffling depends on exactly
three things: the shuffling algorithm, the input and the seed of the
random generator. Hence, for a given list and a given algorithm, the
outcome of the shuffle is purely based on the seed. Many modern computers
have 32 bit random numbers, hence a 32 bit seed. Hence, there are at
most 2^32 possible shuffles of a list, foreach of the possible algorithms.
But for a list of n elements, there are n! possible permutations.
Which means that a shuffle of a list of 13 elements will not generate
certain permutations, as 13! > 2^32.

=head1 REFERENCES

=over

=item [1]

R. Durstenfeld: I<CACM>, B<7>, 1964. pp 420.

=item [2] 

R. A. Fisher and F. Yates: I<Statistical Tables>. London, 1938.
Example 12.

=item [3]

D. E. Knuth: I<The Art of Computer Programming>, Volume 2, Third edition.
Section 3.4.2, Algorithm P, pp 145. Reading: Addison-Wesley, 1997.
ISBN: 0-201-89684-2.

=item [4]

R. Salfi: I<COMPSTAT 1974>. Vienna: 1974, pp 28 - 35.

=back

=head1 HISTORY

    $Date: 1998/04/23 17:45:12 $

    $Log: Shuffle.pm,v $
    Revision 1.1  1998/04/23 17:45:12  abigail
    Initial revision


=head1 AUTHOR

This package was written by Abigail.

=head1 COPYRIGHT

Copyright 1998 by Abigail.

You may use, distribute and modify this package under the same
terms as Perl.

=cut

