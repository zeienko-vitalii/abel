set shell := ["bash", "-c"]
set positional-arguments

very_good := "fvm dart pub global run very_good_cli:very_good"

[private]
default:
    @just --list

[private]
_fvm:
    @command -v fvm >/dev/null || { echo "fvm required: brew install fvm" >&2; exit 1; }

setup: _fvm
    fvm install && \
    fvm flutter pub get && \
    fvm dart pub global activate very_good_cli 1.7.0

build_clean: _fvm
    fvm flutter clean && fvm flutter pub get

gen: _fvm
    fvm flutter --version && \
    fvm flutter pub get && \
    echo "Code generation packages not on pubspec yet"

check: _fvm
    fvm dart format --set-exit-if-changed . && \
    bash -euo pipefail -c 'if rg -q "super\\.key,\\s*required" lib; then rg -n "super\\.key,\\s*required" lib >&2; echo "required named parameters must precede super.key" >&2; exit 1; fi' && \
    fvm flutter analyze --fatal-infos && \
    fvm dart run dart_code_linter:metrics analyze lib --set-exit-on-violation-level=warning && \
    fvm dart run dart_code_linter:metrics check-unused-files lib --fatal-unused && \
    fvm dart run dart_code_linter:metrics check-unused-code lib --fatal-unused

# Paths must be under test/.
test *paths: _fvm
    #!/usr/bin/env bash
    set -euo pipefail
    for test_path in "$@"; do
        [[ "$test_path" == test/* ]] || { echo "test paths must be under test/: $test_path" >&2; exit 1; }
    done
    {{ very_good }} test --coverage --test-randomize-ordering-seed random "$@"
