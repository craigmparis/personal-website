yarn install        || GOTO: exit
yarn build          || GOTO: exit
yarn test           || GOTO: exit

ECHO "Build and test successful"
EXIT /B 0

:exit

ECHO "Error running build_and_test.cmd"
EXIT /B 1