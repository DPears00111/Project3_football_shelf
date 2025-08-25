import express from 'express';
import { 
    getAllTeams,
    getTeam
} from '../controllers/teamsController.js';

const router = express.Router();

//to get users
router.get('/', getAllTeams);
//to get a single team
router.get('/:name', getTeam);

export default router;

