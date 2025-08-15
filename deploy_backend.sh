#!/bin/bash

echo "🚀 Deploying Glowpulse Backend..."

# Check if we're in the right directory
if [ ! -f "backend/package.json" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

echo "📦 Preparing backend for deployment..."

# Create a deployment package
mkdir -p deploy
cp -r backend/* deploy/
cd deploy

echo "🔧 Creating deployment files..."

# Create a simple deployment script
cat > deploy.sh << 'EOF'
#!/bin/bash
echo "Starting Glowpulse Backend..."
npm install
npm start
EOF

chmod +x deploy.sh

echo "✅ Backend prepared for deployment!"
echo ""
echo "📋 Next steps:"
echo "1. Go to https://render.com"
echo "2. Sign up/login with GitHub"
echo "3. Click 'New +' → 'Web Service'"
echo "4. Connect your GitHub repository"
echo "5. Set the following:"
echo "   - Name: glowpulse-backend"
echo "   - Root Directory: backend"
echo "   - Build Command: npm install"
echo "   - Start Command: npm start"
echo "   - Environment: Node"
echo ""
echo "6. Click 'Create Web Service'"
echo "7. Wait for deployment (2-3 minutes)"
echo "8. Copy the URL (e.g., https://glowpulse-backend.onrender.com)"
echo "9. Update lib/src/core/network/dio_client.dart with the new URL"
echo ""
echo "🎯 Your backend will be live and accessible from mobile devices!"

cd ..
