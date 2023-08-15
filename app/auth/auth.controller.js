import asyncHandler from 'express-async-handler';
import { prisma } from '../../prisma/prisma.js';
import { hash, verify } from 'argon2';
import { generateToken } from '../utils/generate-token.util.js';
import { UserFields } from '../utils/user.util.js';

export const authUser = asyncHandler(async (req, res) => {
	const { email, password } = req.body;

	const user = await prisma.user.findUnique({
		where: {
			email,
		},
	});

	const isValidPassword = await verify(user.password, password);

	if (user && isValidPassword) {
		const token = generateToken(user.id);
		res.json({ user, token });
	} else {
		res.status(401);
		throw new Error('Email or password incorrect');
	}
});

export const registerUser = asyncHandler(async (req, res) => {
	const { email, password } = req.body;

	const isUser = await prisma.user.findUnique({
		where: {
			email,
		},
	});

	if (isUser) {
		res.status(400);
		throw new Error('Email is already taken');
	}

	const newUser = await prisma.user.create({
		data: {
			email,
			password: await hash(password),
		},
		select: UserFields,
	});

	const token = generateToken(newUser.id);

	res.json({ newUser, token });
});
