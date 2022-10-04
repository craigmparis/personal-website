SETLOCAL ENABLEEXTENSIONS
@REM @ECHO OFF

CALL tools\buildifier.cmd %~dp0     || GOTO: failure

CALL yarn install                   || GOTO: failure
CALL yarn build                     || GOTO: failure
CALL yarn test  --watchAll=false    || GOTO: failure

ECHO "Build and test successful"
EXIT /B 0

:failure

ECHO "Error running build_and_test.cmd"
EXIT /B 1