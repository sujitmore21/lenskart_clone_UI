#!/bin/bash

# Script to free up space on Android Emulator

echo "Attempting to free up space on Android Emulator..."

# Find adb path
ADB_PATH=$(which adb 2>/dev/null || echo "")

if [ -z "$ADB_PATH" ]; then
    # Try common locations
    if [ -d "$HOME/Library/Android/sdk/platform-tools" ]; then
        ADB_PATH="$HOME/Library/Android/sdk/platform-tools/adb"
    elif [ -d "$HOME/Android/Sdk/platform-tools" ]; then
        ADB_PATH="$HOME/Android/Sdk/platform-tools/adb"
    else
        echo "❌ ADB not found. Please install Android SDK or add it to PATH"
        echo ""
        echo "To fix emulator storage manually:"
        echo "1. Open Android Studio"
        echo "2. Go to AVD Manager"
        echo "3. Click ⋮ (three dots) next to your emulator"
        echo "4. Select 'Wipe Data'"
        echo "5. Restart emulator"
        exit 1
    fi
fi

echo "Using ADB at: $ADB_PATH"
echo ""

# Check if device is connected
if ! $ADB_PATH devices | grep -q "device$"; then
    echo "❌ No Android device/emulator connected"
    echo "Please start your emulator and try again"
    exit 1
fi

echo "✅ Device connected"
echo ""

# Uninstall old test apps
echo "Removing old test apps..."
$ADB_PATH shell pm list packages | grep -E "(test|sample|demo)" | cut -d: -f2 | while read package; do
    echo "  Uninstalling: $package"
    $ADB_PATH uninstall "$package" 2>/dev/null || true
done

# Clear app data for common apps
echo ""
echo "Clearing app data..."
$ADB_PATH shell pm clear com.android.chrome 2>/dev/null || true
$ADB_PATH shell pm clear com.google.android.gms 2>/dev/null || true

# Clear cache
echo ""
echo "Clearing caches..."
$ADB_PATH shell pm trim-caches 500M 2>/dev/null || true

echo ""
echo "✅ Done! Try running 'flutter run' again"
echo ""
echo "If still getting storage errors:"
echo "1. Wipe emulator data: Android Studio → AVD Manager → ⋮ → Wipe Data"
echo "2. Or increase emulator storage: AVD Manager → Edit → Show Advanced → Increase Internal Storage"

