#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
# echo "Secret number is $SECRET_NUMBER" # Comente ou remova esta linha

echo "Enter your username:"
read USERNAME

# Obter informações do usuário
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME'")

if [[ -z $USER_INFO ]]
then
    # Novo usuário
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    GAMES_PLAYED=0 # Inicializa para o novo usuário
    BEST_GAME=0    # Inicializa para o novo usuário
else
    # Usuário existente
    IFS='|' read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
NUMBER_OF_GUESSES=0

while true
do
    read GUESS

    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
        echo "That is not an integer, guess again:"
        continue
    fi

    NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))

    if [[ $GUESS -eq $SECRET_NUMBER ]]
    then
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

        # Atualizar banco de dados
        USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
        UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID")

        if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME || $BEST_GAME -eq 0 ]]
        then
            UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE user_id = $USER_ID")
        fi

        break
    elif [[ $GUESS -gt $SECRET_NUMBER ]]
    then
        echo "It's lower than that, guess again:"
    else
        echo "It's higher than that, guess again:"
    fi
done