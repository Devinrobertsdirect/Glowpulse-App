# 🚀 Quick Deployment Guide

## Backend Deployment (Required for Mobile)

### Option 1: Render (Recommended - Free)
1. Go to [render.com](https://render.com)
2. Sign up with GitHub
3. Click "New +" → "Web Service"
4. Connect your GitHub repo
5. Configure:
   - **Name**: `glowpulse-backend`
   - **Root Directory**: `backend`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Environment**: Node
6. Click "Create Web Service"
7. Wait 2-3 minutes for deployment
8. Copy the URL (e.g., `https://glowpulse-backend.onrender.com`)

### Option 2: Railway (Alternative - Free)
1. Go to [railway.app](https://railway.app)
2. Sign up with GitHub
3. Click "New Project" → "Deploy from GitHub repo"
4. Select your repository
5. Set root directory to `backend`
6. Deploy and get your URL

## Update Flutter App

After getting your backend URL, update this file:
```dart
// lib/src/core/network/dio_client.dart
baseUrl: "https://your-backend-url.com/api",  // Replace with your URL
```

## Test Your Deployment

```bash
# Test signup
curl -X POST https://your-backend-url.com/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{"name":"Test","email":"test@example.com","password":"password"}'

# Test login
curl -X POST https://your-backend-url.com/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"password"}'
```

## Benefits of Deployment

✅ **Works on mobile devices** - No more local network issues  
✅ **Always available** - 24/7 uptime  
✅ **Scalable** - Can handle multiple users  
✅ **Secure** - HTTPS encryption  
✅ **Free** - No cost for basic usage  

## Troubleshooting

- **HTML errors**: Backend not deployed or wrong URL
- **Connection timeout**: Check if backend is running
- **CORS errors**: Backend CORS is already configured
- **Authentication fails**: Check if user is approved in backend

## Next Steps

1. Deploy backend using steps above
2. Update Flutter app with new URL
3. Build and test on mobile device
4. Deploy Flutter app to App Store/Play Store
