import express from 'express';
import { protect } from '../middleware/auth.middleware.js';
import {
	createItem,
	deleteItem,
	getItem,
	getItems,
	updateItem,
} from './item.controller.js';

const router = express.Router();

router.post('/', protect, createItem);
router.get('/', protect, getItems);
router.get('/:id', protect, getItem);
router.put('/:id', protect, updateItem);
router.delete('/:id', protect, deleteItem);

export default router;
