import express from 'express';
import { getAllLeagues, getLeague } from '../controllers/leaguesController.js';

const router = express.Router();

//to get leagues
router.get('/', getAllLeagues);
//to get a singlr league
router.get('/:name', getLeague);

export default router;