#!/bin/bash

semvar=$1
# Input:
# - existing version (x.y.z) -> validare de tip regex; x,y si z trbeuie sa fie numere intre 0 si oricat, separate prin punct (.)
# - type (MAJOR|MINOR|PATCH) -> validare pentru a verifica daca tipul e unul din cele 3 (daca nu, ar trebui sa "crape" scriptul) 
# Output:
# - another version depending on type
function semVarIncrease () {
  if [ -z $1 ]; then
   echo "SemVar not defined";
   exit 1;
  fi 

  if [ -z $2 ]; then
   echo "Release type not defined";
   exit 1;
  fi

  IFS='.' read -a arr <<< $1

  if [ ${#arr[@]} != 3 ]; then
    echo "The SemVar needs to have only 3 digits";
    exit 1;
  fi

  if [ "${arr[0]}" -lt 0 ] || [ "${arr[1]}" -lt 0 ] || [ "${arr[2]}" -lt 0 ]; then
    echo "The SemVar digits need to be positive";
    exit 1;
  fi

  v_major=${arr[0]};
  v_minor=${arr[1]};
  v_patch=${arr[2]};

  if [ "$2" == "MAJOR" ]; then
    v_major=$(($v_major + 1));
    v_minor=0;
    v_patch=0;
  elif [ "$2" == "MINOR" ]; then
    v_minor=$(($v_minor + 1));
    v_patch=0;
  else
    v_patch=$(($v_patch + 1));
  fi

  semvar="${v_major}.${v_minor}.${v_patch}";
  return 0;
}

semVarIncrease $@
echo $semvar