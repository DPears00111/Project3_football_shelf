import express from 'express';
import verifyToken from '../middleware/authMiddleware.js';

const router = express.Router();

router.get('/protected', verifyToken, (req, res) => {
  console.log('✅ Protected route accessed by:', req.user);
  res.status(200).json({
    message: 'Access granted to protected route',
    user: req.user,
  });
});

export default router;