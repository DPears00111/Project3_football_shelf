import pool from '../config/db.js'; //this is the import from the mysql pool

//get all teams
export const getAllTeams = async () => {
    const [rows] = await pool.query('SELECT * FROM teams');
    return rows;
};

//getting teams by name
export const getTeamByName = async (name) => {
    const [rows] = await pool.query('SELECT * FROM teams where team_name = ?', [name]);
    return rows[0];
};

