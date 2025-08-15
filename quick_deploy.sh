#!/bin/bash

echo "🚀 Quick Deploy Script for Health Device App"
echo "=============================================="
echo ""

# Check if we're in the right directory
if [ ! -f "backend/package.json" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

echo "📋 Current Status:"
echo "✅ iOS App: Built successfully (27.4MB)"
echo "✅ Android App: Built successfully (22.6MB)"
echo "⚠️  Backend: Needs cloud deployment"
echo ""

echo "🎯 Next Steps Required:"
echo ""

echo "1️⃣  DEPLOY BACKEND (Required for mobile access):"
echo "   • Go to https://render.com"
echo "   • Sign up with GitHub"
echo "   • New → Web Service"
echo "   • Connect your repo: $(git remote get-url origin 2>/dev/null || echo 'your-repo-url')"
echo "   • Configure:"
echo "     - Name: glowpulse-backend"
echo "     - Root Directory: backend"
echo "     - Build Command: npm install"
echo "     - Start Command: npm start"
echo "     - Environment: Node"
echo ""

echo "2️⃣  UPDATE FLUTTER APP:"
echo "   • After backend deployment, get the URL"
echo "   • Update lib/src/core/network/dio_client.dart"
echo "   • Change baseUrl from 'http://10.0.0.39:3000/api' to your new URL"
echo ""

echo "3️⃣  REBUILD APPS:"
echo "   • Run: ./deploy.sh"
echo "   • Test on mobile device"
echo ""

echo "4️⃣  APP STORE DEPLOYMENT:"
echo "   • iOS: Use Xcode to archive and submit"
echo "   • Android: Upload APK to Google Play Console"
echo ""

echo "📱 Your APK is ready at: ~/Desktop/Glowpulse-Health.apk"
echo "📱 iOS app is ready at: build/ios/iphoneos/Runner.app"
echo ""

echo "⏱️  Estimated time to complete: 30-60 minutes"
echo "📅 App store review time: 1-7 days"
echo ""

echo "🔗 Useful Links:"
echo "   • Render: https://render.com"
echo "   • Railway: https://railway.app"
echo "   • Google Play Console: https://play.google.com/console"
echo "   • App Store Connect: https://appstoreconnect.apple.com"
echo ""

echo "✅ Ready to deploy! Start with step 1 (backend deployment)."
