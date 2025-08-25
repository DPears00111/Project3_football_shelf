import express from 'express';
import { getAllJerseys } from '../controllers/jerseysController.js';

const router = express.Router();

//to get all jerseys
router.get('/', getAllJerseys);

export default router;