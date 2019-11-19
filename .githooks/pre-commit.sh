#!/usr/bin/env bash

# executables
runNodeExec="./node_modules/run-node/run-node"
prettierExec="./node_modules/.bin/prettier"
gitExec="$(which git)"
runPrettier="${runNodeExec} ${prettierExec}"

fileNamesToFix=""
fileNamesToCheck=""
for file in $(${gitExec} diff --cached --name-only | grep -E '\.(js|jsx|ts|tsx|json|scss|html|graphql|md|yml|yaml)$')
do
  fileNamesToCheck+=" $file"
done

if [[ -n "$fileNamesToCheck" ]]
then
  for file in $(${runPrettier} --list-different ${fileNamesToCheck})
  do
    fileNamesToFix+=" $file"
  done
fi

if [[ -n "${fileNamesToFix}" ]]
then
  echo "💅 Running prettier for the following files: "
  echo "⬇️"
  ${runPrettier} --single-quote --write ${fileNamesToFix}
  ${gitExec} add ${fileNamesToFix}
fi
