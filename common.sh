#!/bin/sh

# Array example
# Let's use 7 continent model
CONTINENTS=(
  "North America", "South America", "Antarctida", "Africa", "Europe", "Asia", "Australia"
)

# Associative array 
# (NOTE: it requires bash 4)
declare -A CONTINENTS_POPULATION
CONTINENTS_POPULATION["North America"]=579024000
CONTINENTS_POPULATION["South America"]=422535000
CONTINENTS_POPULATION["Antarctida"]=1106
CONTINENTS_POPULATION["Africa"]=1216130000
CONTINENTS_POPULATION["Europe"]=738849000
CONTINENTS_POPULATION["Asia"]=4436224000
CONTINENTS_POPULATION["Australia"]=39901000


function join_array { echo "$*" | sed 's/ /, /g'; }

