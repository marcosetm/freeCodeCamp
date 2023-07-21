#!/bin/bash

RE="^[0-9]+$"
PSQL="psql -X -U freecodecamp -d periodic_table --tuples-only -c"
RE="^[0-9]+$"
COLUMN=""

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
elif [[ $1 =~ $RE ]]
then
  COLUMN="atomic_number"
elif [[ ${#1} < 3 ]]
then
  COLUMN="symbol"
else 
  COLUMN="name"
fi

RESULT=$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE $COLUMN = '$1';")

if [[ -z $RESULT ]]
then
  echo "I could not find that element in the database."
  exit
else
  echo $RESULT | while read  TYPE_ID BAR ATOMIC_NUM BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
  do
    echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
fi