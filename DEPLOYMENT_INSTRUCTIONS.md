# Backend Deployment Instructions

## Option 1: Railway (Recommended - Free)

1. **Install Railway CLI:**
   ```bash
   npm install -g @railway/cli
   ```

2. **Login to Railway:**
   ```bash
   railway login
   ```

3. **Deploy from backend directory:**
   ```bash
   cd backend
   railway init
   railway up
   ```

4. **Get your deployment URL:**
   ```bash
   railway domain
   ```

## Option 2: Render (Free Alternative)

1. Go to [render.com](https://render.com)
2. Connect your GitHub repository
3. Create a new Web Service
4. Set:
   - Build Command: `npm install`
   - Start Command: `npm start`
   - Environment: Node

## Option 3: Heroku (Paid)

1. Install Heroku CLI
2. Run:
   ```bash
   cd backend
   heroku create your-app-name
   git add .
   git commit -m "Deploy backend"
   git push heroku main
   ```

## After Deployment

1. Get your deployment URL (e.g., `https://your-app.railway.app`)
2. Update the Flutter app's `dio_client.dart` with the new URL
3. Test the endpoints

## Test Your Deployment

```bash
curl -X POST https://your-app.railway.app/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{"name":"Test","email":"test@example.com","password":"password"}'
```
