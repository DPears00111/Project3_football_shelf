import express from 'express';
import cors from 'cors';
import 'dotenv/config';
import pool from '../backend/config/db.js';
import teamsRoutes from '../backend/routes/teamsRoutes.js';
import leaguesRoutes from '../backend/routes/leaguesRoutes.js';
import jerseysRoutes from '../backend/routes/jerseysRoutes.js';

import checkoutRoutes from './routes/checkoutRoutes.js'; 
import authRoutes from './routes/authRoutes.js'; 
import passwordResetRoutes from './routes/passwordResetRoutes.js'; 
import protectedRoutes from './routes/protected.js';
import cartRoutes from './routes/cartRoutes.js';

const app = express();

app.use(express.json());
app.use(cors());

//this is to test if the db is connected successfully
app.get('/test-db', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT 1 + 1 AS result');
    res.json({ success: true, data: rows });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

//using the routes

app.use('/teams', teamsRoutes)
app.use('/leagues', leaguesRoutes)
app.use('/jerseys', jerseysRoutes)
app.use('/checkout', checkoutRoutes); 
app.use('/auth', authRoutes); 
app.use('/password', passwordResetRoutes);
app.use('/cart', cartRoutes);
app.use('/api', protectedRoutes);


const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));