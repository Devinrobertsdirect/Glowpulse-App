const express = require('express');
const cors = require('cors');
const { sequelize } = require('./models');
require('dotenv').config();

const app = express();

app.use(cors());
app.use(express.json());
app.use('/uploads', express.static('uploads'));

const authRoutes = require('./routes/auth');
app.use('/api/auth', authRoutes);

// TODO: Import and use routes
// const authRoutes = require('./routes/auth');
// app.use('/api/auth', authRoutes);

app.get('/', (req, res) => {
  res.send('Health Device Backend API');
});

// Error handler
app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).json({ error: 'Internal Server Error' });
});

const PORT = process.env.PORT || 5000;

sequelize.sync().then(() => {
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
}); 