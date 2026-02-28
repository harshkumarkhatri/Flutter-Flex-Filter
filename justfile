set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

flutter := "flutter"

default:
    @just --list

bootstrap:
    {{flutter}} pub get

fmt:
    dart format .

fmt-check:
    dart format --set-exit-if-changed .

analyze:
    {{flutter}} analyze

test:
    {{flutter}} test

status:
    @git status --short

check-clean:
    @if [ -n "$(git status --porcelain)" ]; then \
      echo "ERROR: git working tree is not clean. Commit or stash changes before publishing."; \
      git status --short; \
      exit 1; \
    fi

dry-run:
    {{flutter}} pub publish --dry-run

dry-run-ignore:
    {{flutter}} pub publish --dry-run --ignore-warnings

check:
    just fmt-check
    just analyze
    just test
    just dry-run

publish:
    just check-clean
    just check
    {{flutter}} pub publish

publish-force:
    just check-clean
    just check
    {{flutter}} pub publish --force

version:
    @grep '^version:' pubspec.yaml | awk '{print $2}'

tag:
    @v="$(just version)"; \
      git tag -a "v${v}" -m "v${v}"

push:
    git push
    git push --tags
