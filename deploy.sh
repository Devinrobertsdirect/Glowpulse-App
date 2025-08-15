#!/bin/bash

# Set up Ruby path for CocoaPods
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"

echo "🚀 Starting deployment..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Build iOS
echo "📱 Building iOS app..."
flutter build ios --release

# Build Android
echo "🤖 Building Android app..."
flutter build apk --release

echo "✅ Deployment complete!"
echo "📱 iOS app: build/ios/iphoneos/Runner.app"
echo "🤖 Android app: build/app/outputs/flutter-apk/app-release.apk"
