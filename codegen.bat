@echo off

echo GETTING DEPENDENCIES...
call dart pub get

echo GENERATING LOCALIZATIONS...
call flutter pub global run intl_utils:generate

echo RUNNING CODEGEN...
call dart run build_runner build --delete-conflicting-outputs

echo FORMATTING CODE...
call dart format lib

echo ANALYZING CODE...
call dart analyze

echo All tasks completed successfully!
