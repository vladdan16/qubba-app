#!/bin/bash

echo "GETTING DEPENDENCIES..."
fvm dart pub get

echo "GENERATING LOCALIZATIONS..."
fvm flutter gen-l10n

echo "RUNNING CODEGEN..."
fvm dart run build_runner build --delete-conflicting-outputs

echo "FORMATTING CODE..."
fvm dart format lib

echo "ANALYZING CODE..."
fvm dart analyze

echo "All tasks completed successfully!"
