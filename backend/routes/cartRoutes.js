import express from 'express';
import { addCartItem } from '../controllers/cartController.js';
const router = express.Router();

// POST /api/cart/add
router.post('/add', addCartItem);

export default router;
