#!/bin/bash -eu
# http://redsymbol.net/articles/unofficial-bash-strict-mode/

# Examples of using program arguments, if-conditions, for-loops, etc

# Including common functions
SCRIPT_DIRECTORY=`dirname $0`
source $SCRIPT_DIRECTORY/common.sh

# Check if file exists, exit with error otherwise
test -f README.md || (echo "README.md not found"; exit 1)

function show_help() {
  echo "Get population of a continent by name"
  echo "Usage control_structures.sh -c Africa"
  echo "You can pass -c world to get population of all continents"
}

function calculate_world_population() {
  # The keys are accessed using an exclamation point: ${!array[@]},
  # the values are accessed using ${array[@]}.

  WORLD_POPULATION=0
  for i in "${!CONTINENTS_POPULATION[@]}"
  do
    # echo "key  : $i"
    # echo "value: ${CONTINENTS_POPULATION[$i]}"

    # Double parentheses needed for arithmetic
    # https://ryanstutorials.net/bash-scripting-tutorial/bash-arithmetic.php
    (( WORLD_POPULATION += ${CONTINENTS_POPULATION[$i]} ))
  done
  
  echo $WORLD_POPULATION
}

CONTINENT=

# check named arguments
# TODO: add more cases of argument usage
while getopts ":h?c:" opt; do
  case "$opt" in
    h|\?)
      print_help
      exit 0
      ;;
    c) CONTINENT="$OPTARG"
      ;;
  esac
done

# Check if argument is empty
if [[ -z "$CONTINENT" ]]; then
  echo "Invalid command line parameters!"
  show_help
  exit 1
fi

# Regex like check
if [[ $CONTINENT == *"America"* ]]; then
  echo "BTW, did you know that the six-continent combined-America model is often used in France and its former possessions, Italy, Portugal, Spain, Romania, Latin America, and Greece. (Wikipedia)"
fi

# String equality check
if [ "$CONTINENT" == "world" ]; then
  echo "Getting world population"
  calculate_world_population
else
  echo ${CONTINENTS_POPULATION[$CONTINENT]}
fi

