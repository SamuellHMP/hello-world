#!/bin/bash

# Define a variável PSQL para consultar o banco de dados
# -t: sem cabeçalhos de coluna
# --no-align: sem alinhamento de coluna, para saída limpa
# -c: comando a ser executado
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Função para exibir informações do elemento
display_element_info() {
  # Extrai as informações da linha do resultado da consulta
  # IFS (Internal Field Separator) define o delimitador de campo, que é '|'
  IFS="|" read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< "$1"

  # Formata a saída conforme especificado nas histórias de usuário
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
}

# Verifica se um argumento foi fornecido
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0 # Sai com status de sucesso
fi

# Tenta pesquisar o elemento pelo número atômico
if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements AS e JOIN properties AS p ON e.atomic_number = p.atomic_number JOIN types AS t ON p.type_id = t.type_id WHERE e.atomic_number = $1")
else # Se não for um número, tenta por símbolo ou nome
  ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements AS e JOIN properties AS p ON e.atomic_number = p.atomic_number JOIN types AS t ON p.type_id = t.type_id WHERE e.symbol = '$1' OR e.name = '$1'")
fi

# Verifica se alguma informação foi encontrada
if [[ -z $ELEMENT_INFO ]]
then
  echo "I could not find that element in the database."
else
  # Chama a função para exibir as informações do elemento encontrado
  display_element_info "$ELEMENT_INFO"
fi
