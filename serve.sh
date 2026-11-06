#!/bin/bash
# Preview the site locally at http://localhost:4000 (mirrors the GitHub Pages build).
# One-time setup: brew install ruby@3.4 && ./serve.sh --install
set -e
cd "$(dirname "$0")"
export PATH="/opt/homebrew/opt/ruby@3.4/bin:$PATH"
# Pair Xcode's compiler with Xcode's own SDK so native gems build.
XCODE_SDK=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
[ -d "$XCODE_SDK" ] && export SDKROOT="$XCODE_SDK"
bundle config set --local path vendor/bundle >/dev/null
if [ "$1" = "--install" ] || ! bundle check >/dev/null 2>&1; then
  bundle install
fi
exec bundle exec jekyll serve --livereload --port 4000
