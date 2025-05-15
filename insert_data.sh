#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS=',' read year round winner opponent winner_goals opponent_goals
do
  # Dentro deste bloco, você pode processar cada linha do arquivo
  if [[ $year != year ]]
  then
    retorno=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
    if [[ retorno = 'INSERT 0 1' ]]
    then
      echo "Inserido o time $winner"
    fi
    retorno=$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")
    if [[ retorno = 'INSERT 0 1' ]]
    then
      echo "Inserido o time $opponent"
    fi
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    retorno=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals)")
    if [[ retorno = 'INSERT 0 1' ]]
    then
      echo "Inserido em games: Ano: $year, Rodada: $round, Vencedor: $winner_id, Oponente: $opponent_id, Gols Vencedor: $winner_goals, Gols Oponente: $opponent_goals"
    fi
  fi
done