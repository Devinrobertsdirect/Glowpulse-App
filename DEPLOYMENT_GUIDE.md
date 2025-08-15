# 🚀 Health Device App Deployment Guide

## Current Status
✅ **Apps Built Successfully**
- iOS: `build/ios/iphoneos/Runner.app` (27.4MB)
- Android: `build/app/outputs/flutter-apk/app-release.apk` (22.6MB)

## 📱 iOS Deployment (App Store)

### Option 1: Using Xcode (Recommended)
1. **Xcode is now open** with your project
2. In Xcode:
   - Select "Product" → "Archive"
   - Wait for archiving to complete
   - Click "Distribute App"
   - Choose "App Store Connect"
   - Follow the upload wizard

### Option 2: Using Command Line
```bash
# Archive the app
xcodebuild -workspace ios/Runner.xcworkspace -scheme Runner -configuration Release -archivePath build/ios/Runner.xcarchive archive

# Export for App Store
xcodebuild -exportArchive -archivePath build/ios/Runner.xcarchive -exportPath build/ios/export -exportOptionsPlist ios/ExportOptions.plist
```

## 🤖 Android Deployment (Google Play Store)

### Option 1: Google Play Console (Production)
1. Go to [Google Play Console](https://play.google.com/console)
2. Create a new app or select existing
3. Upload `build/app/outputs/flutter-apk/app-release.apk`
4. Fill in store listing details
5. Submit for review

### Option 2: Direct APK Distribution (Testing)
```bash
# Copy APK to Desktop for easy access
cp build/app/outputs/flutter-apk/app-release.apk ~/Desktop/Glowpulse-Health.apk
```

## 🔧 Quick Deployment Commands

### Rebuild and Deploy
```bash
# Run the deployment script
./deploy.sh

# Or manually:
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
flutter clean && flutter pub get
flutter build ios --release
flutter build apk --release
```

### iOS Archive
```bash
cd ios
xcodebuild -workspace Runner.xcworkspace -scheme Runner -configuration Release -archivePath ../build/ios/Runner.xcarchive archive
```

## 📋 Pre-Deployment Checklist

### iOS
- [ ] App icon set correctly
- [ ] Bundle identifier: `com.glowpulse.health`
- [ ] Version: 1.0.0+1
- [ ] Code signing configured
- [ ] Privacy policy added (if required)

### Android
- [ ] App icon set correctly
- [ ] Package name: `com.glowpulse.health`
- [ ] Version: 1.0.0+1
- [ ] Signing configured
- [ ] Privacy policy added (if required)

## 🎯 Next Steps

1. **iOS**: Complete the Xcode archive and upload process
2. **Android**: Upload APK to Google Play Console
3. **Both**: Wait for app store review (typically 1-7 days)

## 📞 Support

If you encounter issues:
- iOS: Check Apple Developer documentation
- Android: Check Google Play Console documentation
- Flutter: Run `flutter doctor` to verify setup
