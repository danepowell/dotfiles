#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/PhpStorm.app"
dockutil --no-restart --add "/Applications/Klipped.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Zoom.us.app"
dockutil --no-restart --add "/Applications/1Password.app"

killall Dock
