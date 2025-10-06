@echo off

echo GETTING DEPENDENCIES...
call dart pub get

echo GENERATING LOCALIZATIONS...
call flutter gen-l10n

echo RUNNING CODEGEN...
call dart run build_runner build --delete-conflicting-outputs

echo FORMATTING CODE...
call dart format lib

echo ANALYZING CODE...
call dart analyze

echo All tasks completed successfully!
