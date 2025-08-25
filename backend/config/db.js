import mysql from 'mysql2/promise';
import 'dotenv/config';

//Pool connection
const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
});


//testing connection
try {
    const connection = await pool.getConnection();
    console.log('Connected to database');
    connection.release(); //this line releases the conection back to the pool if it was successful ;)
} catch (err) {
    console.error('Database connection failed:', err);
}

export default pool;