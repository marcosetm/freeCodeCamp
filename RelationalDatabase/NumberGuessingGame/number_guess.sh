#!/bin/bash

PSQL="psql -U freecodecamp -d number_guess -AXtc"
RE="^[0-9]+$"
PLAYER_ID=""
PLAYER_NAME=""
GAMES_PLAYED=0
BEST_GAME=0
SECRET_NUM=0
NUM_GUESSES=0

MAIN() {
  echo -e "\n~~~ WELCOME TO THE NUMBER GUESSNIG GAME ~~~\n"
  # get username
  echo -n "Enter your username: "
  read USER_INPUT

  # GET USER
  GET_PLAYER $USER_INPUT

  if [[ -z $PLAYER_NAME ]]
  then
    # echo welcome message for new user
    CREATE_USER $USER_INPUT
    echo "Welcome, $PLAYER_NAME! It looks like this is your first time here."
  else
    # echo welcome message for existing user
    if [[ -z $BEST_GAME ]]
    then
      echo "Welcome back, $PLAYER_NAME! You have played $GAMES_PLAYED games, and your best game took 0 guesses."
    else
      echo "Welcome back, $PLAYER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    fi
  fi

  # generate random number
  GENERATE_RANDOM_NUMBER 1 1000
  
  # game loop
  while true
  do
    # get user input
    if [[ $NUM_GUESSES == 0 ]]
    then
      echo -n "Guess the secret number between 1 and 1000: "
    fi
    
    read PLAYER_GUESS
    
    if ! [[ $PLAYER_GUESS =~ $RE ]]
    then
      echo "That is not an integer, guess again:"
      continue
    else
      (( NUM_GUESSES++ ))
      # check input
      if [[ "$PLAYER_GUESS" == "$SECRET_NUM" ]]
      then
        echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET_NUM. Nice job!"
        INSERT_STATS $NUM_GUESSES $PLAYER_ID
        exit 1
      elif [[ "$PLAYER_GUESS" -le "$SECRET_NUM" ]] 
      then
        echo -n "It's higher than that, guess again: "
      else
        echo -n "It's lower than that, guess again: "
      fi
    fi
  done
  
}

GET_PLAYER() {
  PLAYER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$1';")

  if ! [[ -z $PLAYER_ID ]]
  then
    DATA=$($PSQL "SELECT users.username, COUNT(stats.game_id), MIN(stats.total_guesses) FROM users LEFT JOIN stats USING(user_id) WHERE user_id = $PLAYER_ID GROUP BY users.user_id;")
    IFS="|" read -r PLAYER_NAME GAMES_PLAYED BEST_GAME <<< $DATA
  fi
}

CREATE_USER() {
  CREATE_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$1');")
  if [[ $CREATE_RESULT == "INSERT 0 1" ]]
  then
    GET_PLAYER $1
  else
    echo "something went wrong"
    exit
  fi
}

GENERATE_RANDOM_NUMBER() {
  SECRET_NUM=$(( $1 + $RANDOM % $2 ))
}

INSERT_STATS() {
  INSERT_RESULTS=$($PSQL "INSERT INTO stats(total_guesses, user_id) VALUES($1,$2);")
}

MAIN