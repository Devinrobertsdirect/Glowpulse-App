require('dotenv').config();

module.exports = {
  db: {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'health_device',
    dialect: 'mysql',
  },
  jwtSecret: process.env.JWT_SECRET || 'supersecretkey',
  jwtExpiresIn: '7d',
  firebase: {
    serviceAccount: process.env.FIREBASE_SERVICE_ACCOUNT || '',
  },
}; 