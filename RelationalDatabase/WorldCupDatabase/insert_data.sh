#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo -e "\n~~ BEGIN INSERT ~~"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
  # check if team already in teams table
    TEAM_ID1=$( $PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    TEAM_ID2=$( $PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    if [[ -z $TEAM_ID1 && -z $TEAM_ID2 ]]
    then 
      echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER'), ('$OPPONENT');")
    elif [[ -z $TEAM_ID1 ]]
    then
      echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
    elif [[ -z $TEAM_ID2 ]]
    then
      echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
    fi
    # get winner_id and opponent_id
    WINNER_ID=$( $PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    OPPONENT_ID=$( $PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    # insert into games table
    if [[ -n $WINNER_ID && -n $OPPONENT_ID ]]
    then
      echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
    fi
  fi
done

echo -e "\n ~~ Inserting Data Completed ~~"