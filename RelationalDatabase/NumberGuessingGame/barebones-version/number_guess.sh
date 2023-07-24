#!/bin/bash
PSQL="psql -U freecodecamp -d number_guess -AXtc"
RE="^[0-9]+$"

echo "Enter your username:"
read USERNAME_INPUT

PLAYER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME_INPUT';")

if [[ -z $PLAYER_ID ]]
then 
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME_INPUT');")
  PLAYER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME_INPUT';")
  echo "Welcome, $USERNAME_INPUT! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM stats WHERE user_id = $PLAYER_ID;")
  BEST_GAME=$($PSQL "SELECT MIN(total_guesses) FROM stats WHERE user_id = $PLAYER_ID;")
  echo "Welcome back, $USERNAME_INPUT! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUM=$(( 1 + $RANDOM % 1000))
echo "SECRET_NUM=$SECRET_NUM "
GUESSES=0
USER_GUESS=0

while [[ ! $USER_GUESS == $SECRET_NUM ]]
do
  if [[ "$GUESSES" == 0 ]]
  then
    echo "Guess the secret number between 1 and 1000:"
  fi
  read USER_GUESS
  (( GUESSES++ ))
  if [[ ! $USER_GUESS =~ $RE ]]
  then 
    echo "That is not an integer, guess again:"
  else
    if [[ $USER_GUESS -gt $SECRET_NUM ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $USER_GUESS -lt $SECRET_NUM ]] 
    then
      echo "It's higher than that, guess again:"
    fi
  fi
done

INSERT_STATS=$($PSQL "INSERT INTO stats(total_guesses, user_id) VALUES($GUESSES, $PLAYER_ID);")
echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUM. Nice job!"
