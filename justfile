set shell := ["bash", "-c"]
set positional-arguments

fvm := `command -v fvm || true`
dart := if fvm == "" { "dart" } else { "fvm dart" }
very_good := dart + " pub global run very_good_cli:very_good"

[private]
default:
    @just --list

build_gen:
    fvm dart run build_runner build -d

build_clean:
    fvm flutter clean && fvm flutter pub get

build_clean_ios: build_clean
    cd ios && pod cache clean --all && pod install

build_l10n:
    fvm dart run slang

gen:
    fvm flutter --version && \
    fvm flutter clean && \
    fvm flutter pub get && \
    fvm dart run build_runner build --delete-conflicting-outputs && \
    fvm dart run slang && \
    echo "Code generation completed successfully!"

check:
    fvm dart format --set-exit-if-changed . && \
    fvm flutter analyze --fatal-infos && \
    fvm dart run dart_code_linter:metrics analyze lib --set-exit-on-violation-level=warning && \
    fvm dart run dart_code_linter:metrics check-unused-files lib --fatal-unused && \
    fvm dart run dart_code_linter:metrics check-unused-code lib --fatal-unused

# Paths must be under test/. TZ=Europe/Berlin so DST tests see real clock changes.
test *paths:
    #!/usr/bin/env bash
    set -euo pipefail
    set -f
    for test_path in "$@"; do
        case "$test_path" in
            test/*) ;;
            *) echo "TEST_PATHS entries must be under test/: $test_path" >&2; exit 1 ;;
        esac
        case "$test_path" in
            *[!A-Za-z0-9_./-]*) echo "TEST_PATHS entry has unsupported characters: $test_path" >&2; exit 1 ;;
        esac
    done
    TZ=Europe/Berlin {{ very_good }} test --coverage --test-randomize-ordering-seed random "$@" <<< "$(echo n)"
