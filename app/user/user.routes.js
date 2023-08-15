import express from 'express';
import { getUserProfile } from './user.controller.js';
import { protect } from '../middleware/auth.middleware.js';

const router = express.Router();

router.get('/profile', protect, getUserProfile);

export default router;
