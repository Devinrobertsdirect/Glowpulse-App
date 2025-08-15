#!/bin/bash

if [ -z "$1" ]; then
    echo "❌ Error: Please provide your backend URL"
    echo "Usage: ./test_backend.sh https://your-backend-url.com"
    echo ""
    echo "Example:"
    echo "./test_backend.sh https://glowpulse-backend.onrender.com"
    exit 1
fi

BACKEND_URL=$1
BACKEND_URL=${BACKEND_URL%/}

echo "🧪 Testing backend at: $BACKEND_URL"
echo ""

# Test 1: Health check
echo "1️⃣ Testing health check..."
curl -s "$BACKEND_URL" | head -1
echo ""
echo ""

# Test 2: Signup
echo "2️⃣ Testing signup..."
SIGNUP_RESPONSE=$(curl -s -X POST "$BACKEND_URL/api/auth/signup" \
  -H "Content-Type: application/json" \
  -d '{"name":"Test User","email":"test@example.com","password":"password123"}')

echo "Signup response:"
echo "$SIGNUP_RESPONSE" | python3 -m json.tool 2>/dev/null || echo "$SIGNUP_RESPONSE"
echo ""
echo ""

# Test 3: Login
echo "3️⃣ Testing login..."
LOGIN_RESPONSE=$(curl -s -X POST "$BACKEND_URL/api/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"password123"}')

echo "Login response:"
echo "$LOGIN_RESPONSE" | python3 -m json.tool 2>/dev/null || echo "$LOGIN_RESPONSE"
echo ""
echo ""

echo "✅ Backend tests completed!"
echo ""
echo "📱 If all tests pass, your backend is ready for mobile deployment!"
