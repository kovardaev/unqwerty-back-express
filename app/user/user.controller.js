import asyncHandler from 'express-async-handler';
import { prisma } from '../../prisma/prisma.js';
import { UserFields } from '../utils/user.util.js';
// import { hash, verify } from 'argon2';
// import { generateToken } from '../utils/generate-token.util.js';

export const getUserProfile = asyncHandler(async (req, res) => {
	const user = await prisma.user.findUnique({
		where: {
			id: req.user.id,
		},
		select: UserFields,
	});

	const itemsCount = await prisma.item.count({
		where: {
			userId: user.id,
		},
	});

	res.json({
		...user,
		statistics: [
			{
				label: 'Items total',
				value: itemsCount,
			},
		],
	});
});
