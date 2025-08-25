import { 
    getAllTeams as getAllTeamsFromModel,
    getTeamByName as getTeamByNameFromModel
} from "../models/teamsModel.js";

export const getAllTeams = async (req, res) => {
    try {
        const teams = await getAllTeamsFromModel();
        res.json(teams);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};





//getting a team by their name (quiet easy once i got the hang of it)
export const getTeam = async (req, res) => {
    try {
        const team = await getTeamByNameFromModel(req.params.name);
        if (!team) {
            return res.status(404).json({error: 'Team not found'});
        }
        res.json(team);
    } catch (err) {
        res.status(500).json({ error: err.message});
    }
};