import express from 'express';
import { createOrder, processPayment } from '../controllers/checkoutController.js';

const router = express.Router();

router.post('/checkout', createOrder);
router.post('/payment', processPayment);

export default router;