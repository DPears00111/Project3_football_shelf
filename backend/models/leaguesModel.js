import pool from '../config/db.js';

//get all leagues
export const getAllLeagues = async () => {
    const [rows] = await pool.query('SELECT * FROM leagues');
    return rows;
};

//getting leagues by their name
export const getLeagueByName = async (name) => {
    const [rows] = await pool.query('SELECT * FROM leagues where league_name = ?', [name]);
    return rows[0];
};