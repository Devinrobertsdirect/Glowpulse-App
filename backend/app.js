const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

app.use(cors());
app.use(express.json());

// Mock user data for testing
const users = [
  {
    id: 1,
    documentId: 'doc-1',
    username: 'test@example.com',
    email: 'test@example.com',
    provider: 'local',
    fullname: 'Test User',
    approved: true,
    confirmed: true,
    blocked: false,
    createdAt: new Date(),
    updatedAt: new Date(),
    publishedAt: new Date(),
    password: 'password'
  }
];

// Auth routes
app.post('/api/auth/login', (req, res) => {
  const { email, password } = req.body;
  
  // Find user by email
  const user = users.find(u => u.email === email);
  
  if (user && (password === 'password' || user.password === password)) {
    // Check if user is approved
    if (!user.approved) {
      return res.status(401).json({ error: { message: 'You have not been approved yet. Please wait for approval.' } });
    }
    
    res.json({
      user: user,
      jwt: 'mock-jwt-token'
    });
  } else {
    res.status(401).json({ error: { message: 'Invalid credentials' } });
  }
});

app.post('/api/auth/signup', (req, res) => {
  const { name, email, password } = req.body;
  
  // Check if user already exists
  const existingUser = users.find(u => u.email === email);
  if (existingUser) {
    return res.status(400).json({ error: { message: 'User already exists' } });
  }
  
  // Create new user with password - automatically approved
  const newUser = {
    id: users.length + 1,
    documentId: `doc-${users.length + 1}`,
    username: email,
    email: email,
    provider: 'local',
    fullname: name,
    password: password, // Store password for authentication
    approved: true, // Automatically approved - no admin approval needed
    confirmed: true,
    blocked: false,
    createdAt: new Date(),
    updatedAt: new Date(),
    publishedAt: new Date()
  };
  
  users.push(newUser);
  
  res.json({
    user: newUser,
    message: 'User created successfully and approved!'
  });
});

// Note: Admin approval removed - all users are automatically approved

app.get('/', (req, res) => {
  res.send('Health Device Backend API');
});

// Error handler
app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).json({ error: 'Internal Server Error' });
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  console.log(`Test credentials: test@example.com / password`);
}); 