#!/usr/bin/env perl

# Please create a small application that will convert numbers from 1 to 100,000
# into words. It will need to include all punctuation and conjunctions.
# The application will need to allow the user to input a range (start and end). If no
# range is provided, it should output the entire range above (1 to 100,000 in words)


use strict;
use warnings;

# this libraries need to be installed in order to execute all the code
use feature qw /say/;
use Scalar::Util qw(looks_like_number);
use Lingua::EN::Numbers qw/ num2en /;

numberToWordsFromUserInput();

#---------------------------------------------
# numberToWordsFromUserInput
#
# It prints out the range of numbers between
# the inputs from the user in words
#---------------------------------------------

sub numberToWordsFromUserInput {
    # ask for the first number and check if they are just pressing enter
    # or they introduce a number
    say "Introduce the first number (from 1 to 100,000):";
    my $first_number = <STDIN>;
    chomp $first_number;
    die("You need to enter an integer\n") if ($first_number && !looks_like_number($first_number));
    die("Number needs to be between 1 and 100,000") if ($first_number && $first_number > 100000);
    
    # ask for the second number and check if they are just pressing enter
    # or they introduce a number
    say "Introduce the second number (from 1 to 100,000):";
    my $second_number = <STDIN>;
    chomp $second_number;
    die("You need to enter an integer\n") if ($second_number && !looks_like_number($second_number));
    die("Number needs to be between 1 and 100,000") if ($second_number && $second_number > 100000);
    
    # making sure that the user enters the smaller value in first place
    die("first number needs to be smaller than second number") if 
        (
            ($first_number && $first_number) && 
            $first_number >= $second_number
        );

    # if they are numbers, then generate the range and display the wordy numbers
    # otherwise just generate the whole range from 1 to 100,000 and displaying the wordy numbers
    if (
        looks_like_number($first_number) &&
        looks_like_number($second_number)
    ) {
        my @array_numbers_wordy = ($first_number .. $second_number);

        for (@array_numbers_wordy) {
            say num2en($_);
        }
    }
    else {
        my @all_numbers_range = (1 .. 100000);
        for (@all_numbers_range) {
            say num2en($_);
        }
    }
}


