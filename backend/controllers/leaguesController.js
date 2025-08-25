import { 
    getAllLeagues as getAllLeaguesFromModel,
    getLeagueByName as getLeagueByNameFromModel
 } from "../models/leaguesModel.js";

export const getAllLeagues = async (req, res) => {
    try{
        const leagues = await getAllLeaguesFromModel();
        res.json(leagues);
    } catch (err) {
        res.status(500).json({ error: err.message});
    }
};

//getting leagues by their name
export const getLeague = async (req, res) => {
    try {
        const league = await getLeagueByNameFromModel(req.params.name);
        if (!league) {
            return res.status(404).json({error: 'League Not Found'});
        }
        res.json(league);
    } catch (err) {
        res.status(500).json({ error: err.message});
    }
};