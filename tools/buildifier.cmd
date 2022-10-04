SETLOCAL ENABLEEXTENSIONS
@ECHO OFF

CALL bazel build //:buildifier
FOR /F "tokens=* USEBACKQ" %%F IN (`bazel info output_path`) DO (
SET bazel_output_path=%%F
)
SET buildifier_short_path=host/bin/external/com_github_bazelbuild_buildtools/buildifier/buildifier_/buildifier.exe || GOTO fail
SET buildifier_full_path=%bazel_output_path%/%buildifier_short_path% || GOTO fail
SET buildifier_full_path=%buildifier_full_path:/=\% || GOTO fail
SET buildifier_full_path=%buildifier_full_path:C:\=C:\\% || GOTO fail
CALL %buildifier_full_path% -r --lint=warn %1 || GOTO fail

ECHO ********************************
ECHO All buildifier checks successful
ECHO ********************************
exit /b 0

:fail

ECHO ********************************
ECHO There were issues with buildifier
ECHO ********************************

exit /b 1