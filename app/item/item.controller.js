import asyncHandler from 'express-async-handler';
import { prisma } from '../../prisma/prisma.js';

export const getItems = asyncHandler(async (req, res) => {
	const items = await prisma.item.findMany({
		where: {
			userId: req.user.id,
		},
		orderBy: {
			updatedAt: 'desc',
		},
	});

	res.json(items);
});

export const getItem = asyncHandler(async (req, res) => {
	const item = await prisma.item.findUnique({
		where: {
			id: +req.params.id,
		}
	});

	res.json(item);
});

export const updateItem = asyncHandler(async (req, res) => {
	const { title, username, password, website, notes } = req.body;

	try {
		const item = await prisma.item.update({
			where: {
				id: +req.params.id,
			},
			data: {
				title,
				username,
				password,
				website,
				notes,
			},
		});

		res.json(item);
	} catch (err) {
		res.status(404);
		throw new Error('Item not found');
	}
});

export const createItem = asyncHandler(async (req, res) => {
	const { title, username, password, website, notes } = req.body;

	const item = await prisma.item.create({
		data: {
			title,
			username,
			password,
			userId: req.user.id
		},
	});

	res.json(item);
});

export const deleteItem = asyncHandler(async (req, res) => {
	try {
		const item = await prisma.item.delete({
			where: {
				id: +req.params.id,
			},
		});

		res.json({ message: 'Item deleted' });
	} catch (err) {
		res.status(404);
		throw new Error('Item not found');
	}
});
