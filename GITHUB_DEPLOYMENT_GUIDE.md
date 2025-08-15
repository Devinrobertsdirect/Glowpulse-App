# 🚀 GitHub Deployment Guide for Devinrobertsdirect

Your repository is now ready for deployment: **https://github.com/Devinrobertsdirect/Glowpulse-App.git**

## Option 1: Deploy to Render (Recommended - Free)

1. **Go to Render.com**
   - Visit [render.com](https://render.com)
   - Sign up/login with GitHub

2. **Create New Web Service**
   - Click "New +" → "Web Service"
   - Connect your GitHub repository: `Devinrobertsdirect/Glowpulse-App`

3. **Configure Deployment**
   - **Name**: `glowpulse-backend`
   - **Root Directory**: `backend`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Environment**: Node

4. **Deploy**
   - Click "Create Web Service"
   - Wait 2-3 minutes for deployment
   - Copy your URL (e.g., `https://glowpulse-backend.onrender.com`)

## Option 2: Deploy to Railway (Alternative - Free)

1. **Go to Railway.app**
   - Visit [railway.app](https://railway.app)
   - Sign up/login with GitHub

2. **Create New Project**
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose `Devinrobertsdirect/Glowpulse-App`

3. **Configure**
   - Set root directory to `backend`
   - Railway will auto-detect Node.js

4. **Deploy**
   - Click "Deploy Now"
   - Get your URL from the dashboard

## After Getting Your Backend URL

1. **Update Flutter App:**
   ```bash
   ./update_backend_url.sh https://your-backend-url.com
   ```

2. **Test Your Backend:**
   ```bash
   ./test_backend.sh https://your-backend-url.com
   ```

3. **Build Your App:**
   ```bash
   flutter build ios
   flutter build apk
   ```

## Your Repository Structure

```
Glowpulse-App/
├── backend/           # Node.js backend (deploy this)
│   ├── app.js        # Main server file
│   ├── package.json  # Dependencies
│   └── render.yaml   # Render config
├── lib/              # Flutter app code
├── deploy_backend.sh # Deployment script
├── update_backend_url.sh # URL update script
└── test_backend.sh   # Testing script
```

## Quick Commands

```bash
# Deploy backend to Render
# (Follow web steps above)

# Update Flutter app with new URL
./update_backend_url.sh https://your-backend-url.com

# Test backend
./test_backend.sh https://your-backend-url.com

# Build Flutter app
flutter build ios
flutter build apk
```

## Benefits

✅ **Free hosting** - No cost for basic usage  
✅ **Always online** - 24/7 availability  
✅ **Mobile ready** - Works on all devices  
✅ **HTTPS secure** - Encrypted connections  
✅ **Auto-scaling** - Handles multiple users  

Your app will work perfectly on mobile devices once deployed! 🎯
