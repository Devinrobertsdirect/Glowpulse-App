#!/bin/bash

if [ -z "$1" ]; then
    echo "❌ Error: Please provide your backend URL"
    echo "Usage: ./update_backend_url.sh https://your-backend-url.com"
    echo ""
    echo "Example:"
    echo "./update_backend_url.sh https://glowpulse-backend.onrender.com"
    exit 1
fi

BACKEND_URL=$1

# Remove trailing slash if present
BACKEND_URL=${BACKEND_URL%/}

echo "🔄 Updating backend URL to: $BACKEND_URL"

# Update the dio_client.dart file
sed -i '' "s|baseUrl: \".*\"|baseUrl: \"$BACKEND_URL/api\"|" lib/src/core/network/dio_client.dart

echo "✅ Backend URL updated successfully!"
echo ""
echo "📱 Next steps:"
echo "1. Test the connection:"
echo "   curl $BACKEND_URL"
echo ""
echo "2. Build and test your Flutter app:"
echo "   flutter build ios"
echo "   flutter build apk"
echo ""
echo "3. Your app should now work on mobile devices!"
