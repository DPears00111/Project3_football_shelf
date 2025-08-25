import pool from "../config/db.js";

//get all jerseys
export const getAllJerseys = async () => {
    const [rows] = await pool.query('SELECT * FROM jerseys');
    return rows;
};