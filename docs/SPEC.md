# Abel — Product Spec

## What it is
Abel is a local macOS app that runs a Flutter app's whole release
from one window: see what's live, pick the next build number,
build, upload, and follow the release until it's out.

## Problem
Releasing a Flutter app with several flavors means juggling Play
Console, App Store Connect, TestFlight, the terminal and git.
It's easy to lose track of what's live where, reuse a build number,
ship the wrong commit, or miss a rejection.

## Who it's for
Flutter developers who ship their own apps to Google Play and the
App Store from a Mac.

## Features (MVP)

### Projects and flavors
Pick a project folder; Abel detects its flavors automatically.
Solves: no manual setup per app or flavor.

### Status dashboard
For each flavor, shows version and build number on every Play
track, TestFlight and the App Store.
Solves: one place to see what's live where.

### Next build number
Computes the next build number as max+1 across all tracks for the
flavor. Optionally commits the bump and creates a `v1.2.3` tag.
Solves: no rejected uploads from a reused build number, and git
matches what shipped.

### Pre-release checks
Before a build, warns about uncommitted changes, the wrong branch,
or a `pubspec.yaml` version that doesn't match the build number.
Warnings don't block the build.
Solves: shipping the wrong commit or version by accident.

### Build and upload
Runs `flutter build` for the chosen flavor and uploads to Play
tracks and TestFlight, with the build log shown in the app.
Solves: the release happens in one window instead of a terminal
plus two consoles.

### Retry upload
If an upload fails, the built artifact is kept and the upload can
be retried with one click, without rebuilding.
Solves: losing 10–20 minutes to a rebuild after a network or API
error.

### Promote between test tracks
Moves an uploaded build between Play test tracks (internal,
closed, open) without rebuilding.
Solves: rebuilding just to change tracks.

### Notifications
macOS notifications when TestFlight processing finishes, Play
review completes, a rollout changes, or a build is rejected.
Solves: no refreshing consoles to find out what happened.

### Release notes
Written by hand by default; optionally an AI draft from `git log`
via OpenAI, edited before it's sent with the build. Only commit
messages are sent to the model.
Solves: faster, consistent "What's new" text without losing control.

### Release history
A local log of every upload: flavor, version and build, commit,
track, notes and time, viewable in the app.
Solves: answering "what did we ship, and when?"

## Deferred
- Promoting to Play production and submitting for App Store review.
- External TestFlight testing and tester groups.
- Building all flavors in one go.
- Signing certificate, profile and API key expiry warnings.
- Crash and rating summary per version.
- Localized release notes.

## Non-goals
- Billing, teams, cloud or CI.
- Store screenshots and metadata.
- Slack or email integrations.

## Product constraints
- Runs locally on macOS.
- Store credentials never leave the user's machine.
