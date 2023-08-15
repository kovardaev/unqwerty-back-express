import express from 'express';
import 'dotenv/config';
import authRoutes from './app/auth/auth.routes.js';
import userRoutes from './app/user/user.routes.js';
import itemRoutes from './app/item/item.routes.js';
// import vaultRoutes from './app/vault/vault.routes.js';
import { prisma } from './prisma/prisma.js';
import { errorHandler, notFound } from './app/middleware/error.middlware.js';
import cors from 'cors';

const app = express();
const port = process.env.PORT;
const env = process.env.NODE_ENV;

const main = async () => {
	app.use(cors());
	app.use(express.json());

	app.use('/api/auth', authRoutes);
	app.use('/api/users', userRoutes);
	app.use('/api/items', itemRoutes);
	// app.use('/api/vaults', vaultRoutes);

	app.use(notFound);
	app.use(errorHandler);

	app.listen(
		port,
		console.log(`Server is running on port ${port} in ${env} mode`)
	);
};

main()
	.then(async () => {
		await prisma.$disconnect();
	})
	.catch(async (err) => {
		console.error(err);
		await prisma.$disconnect();
		process.exit(1);
	});
