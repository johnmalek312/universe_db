#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


skip_headers=1
while IFS=, read -r col1 col2 col3 col4 col5 col6
do
    if ((skip_headers))
    then
        ((skip_headers--))
    else
        echo "I got:$col3|$col4"

        $PSQL "INSERT INTO teams (name) SELECT '$col3' WHERE NOT EXISTS (SELECT 1 FROM teams WHERE name = '$col3');INSERT INTO teams (name) SELECT '$col4' WHERE NOT EXISTS (SELECT 1 FROM teams WHERE name = '$col4');";

        $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($col1, '$col2', (SELECT team_id from teams where ('$col3'=name)),(SELECT team_id from teams where ('$col4'=name)),$col5,$col6);"


    fi
done < games.csv