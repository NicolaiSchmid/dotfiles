#!/bin/sh

function print_usage()
{
    echo "[command] sqm rent/sq price"
}

sqm=$1
rent_sqm=$2
price=$3

if [ -z "$sqm" ]
then
    print_usage
    exit 1
fi

if [ -z "$rent_sqm" ]
then
    print_usage
    exit 1
fi

if [ -z "$price" ]
then
    print_usage
    exit 1
fi

echo "(($sqm * $rent_sqm * 12) / $price) * 100" | bc -l