#!/usr/bin/env bash

set -e

# ============================================================================
# macOS Settings Configuration
# ============================================================================
# A curated collection of macOS defaults for developers
# Usage: ./settings.sh
# ============================================================================

echo "Configuring macOS..."
echo

# Close System Preferences to prevent conflicts
osascript -e 'quit app "System Preferences"' 2>/dev/null || true

# ============================================================================
# GENERAL UI/UX
# ============================================================================

echo "[*] General UI/UX"

# Jump to the spot that's clicked in scroll bars
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true

# Enable full keyboard access for all controls
# Allows tabbing through all UI elements, not just text fields
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set a faster keyboard repeat rate
# Helps with navigation in code editors and terminal
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable press-and-hold for special characters
# Enables key repeat instead of character accent menu
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# ============================================================================
# MENU BAR
# ============================================================================

echo "[*] Menu Bar"

# Show battery percentage
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Make status icons smaller (helps with notch and saves space)
# https://flaky.build/built-in-workaround-for-applications-hiding-under-the-macbook-pro-notch
defaults write -globalDomain NSStatusItemSelectionPadding -int 12
defaults write -globalDomain NSStatusItemSpacing -int 12

# Hide Spotlight icon (we use cmd+space anyway)
defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true

# Show time with seconds in menu bar clock
defaults write com.apple.menuextra.clock ShowSeconds -bool true

# ============================================================================
# TRACKPAD
# ============================================================================

echo "[*] Trackpad"

# Enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Set tracking speed to fast (0-3 scale, 2.0 is 4 positions from right)
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2.0

# ============================================================================
# SECURITY & PRIVACY
# ============================================================================

echo "[*] Security & Privacy"

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# ============================================================================
# FINDER
# ============================================================================

echo "[*] Finder"

# Set Downloads as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

# Show status bar and path bar
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Hide Tags from Finder sidebar
defaults write com.apple.finder ShowRecentTags -bool false

# Hide iCloud items from Finder sidebar
defaults write com.apple.finder SidebarShowingiCloudDesktop -bool false
defaults write com.apple.finder SidebarShowingSignedIntoiCloud -bool false
defaults write com.apple.sidebarlists systemitems.ShowCloudDocs -bool false

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Expand the following File Info panes:
# "General", "Open with", and "Sharing & Permissions"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

# ============================================================================
# HOT CORNERS
# ============================================================================

echo "[*] Hot Corners"

# Hot corners require Option key to be pressed
# Prevents accidental activation
defaults write com.apple.dock wvous-tl-modifier -int 524288
defaults write com.apple.dock wvous-tr-modifier -int 524288
defaults write com.apple.dock wvous-bl-modifier -int 524288
defaults write com.apple.dock wvous-br-modifier -int 524288

# ============================================================================
# DOCK
# ============================================================================

echo "[*] Dock"

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 48

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Minimize windows into their application's icon
defaults write com.apple.dock minimize-to-application -bool true

# Show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Lock the Dock size (disable resizing)
defaults write com.apple.dock size-immutable -bool yes

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# ============================================================================
# NUMBER FORMAT
# ============================================================================

echo "[*] Number Format"

# Use dots as decimal separator (instead of commas)
# 0 = decimal separator, 1 = grouping separator
defaults write NSGlobalDomain AppleICUNumberSymbols -dict 0 "." 1 ","

# ============================================================================
# SAFARI
# ============================================================================

echo "[*] Safari"

# Enable the Develop menu and Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# ============================================================================
# APP STORE
# ============================================================================

echo "[*] App Store"

# Disable in-app rating requests
defaults write com.apple.appstore InAppReviewEnabled -int 0

# ============================================================================
# APPLY CHANGES
# ============================================================================

echo
echo "Restarting affected applications..."

# Kill affected applications
for app in "Finder" "Dock" "SystemUIServer" "ControlCenter"; do
    killall "${app}" &> /dev/null || true
done

echo
echo "Configuration complete."
echo "Note: Some changes require a logout/restart to take effect."