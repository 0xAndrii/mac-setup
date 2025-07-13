# mac-setup

[![Platform: macOS](https://img.shields.io/badge/Platform-macOS-blue.svg)](https://www.apple.com/macos/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A minimal, opinionated macOS configuration script for developers.

## Overview

This repository contains a single script that configures macOS with sensible defaults for development work. The settings are carefully chosen to enhance productivity while maintaining system stability.

## Installation

```bash
git clone https://github.com/0xAndrii/mac-setup.git
cd mac-setup
./settings.sh
```

## What It Configures

### General UI/UX
- Click in scroll bar to jump to spot
- Full keyboard access for all controls
- Fast key repeat rate
- Disable press-and-hold for accents

### Menu Bar
- Show battery percentage
- Reduce status icon spacing (helpful for MacBooks with notch)
- Hide Spotlight icon (use ⌘Space instead)

### Trackpad
- Enable tap to click
- Fast tracking speed

### Security
- Require password immediately after sleep/screensaver

### Finder
- Set Downloads as default folder
- Show hidden files and file extensions
- Enable path bar and status bar
- Allow Finder quitting with ⌘Q
- Enable text selection in Quick Look
- Prevent .DS_Store files on network/USB drives
- Expand file info panes by default
- Keep folders on top when sorting
- Hide Tags and iCloud from sidebar

### Dock
- Auto-hide with no delay
- 48px icon size (locked)
- Show app indicators
- Minimize to application icon
- Hide recent apps

### Hot Corners
- Require Option key (prevents accidental activation)

### App Store
- Disable in-app rating requests

## Requirements

- macOS 12.0 or later
- Administrator access

## Notes

- Some changes require logout/restart to take effect
- The script will restart Finder, Dock, and SystemUIServer
- All changes can be reverted through System Settings

## Related

- [0xAndrii/dotfiles](https://github.com/0xAndrii/dotfiles) - Personal dotfiles managed with Chezmoi

## License

MIT