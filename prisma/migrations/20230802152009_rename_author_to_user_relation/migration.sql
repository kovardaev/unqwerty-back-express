/*
  Warnings:

  - You are about to drop the column `authorId` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `authorId` on the `Vault` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Item" DROP CONSTRAINT "Item_authorId_fkey";

-- DropForeignKey
ALTER TABLE "Vault" DROP CONSTRAINT "Vault_authorId_fkey";

-- AlterTable
ALTER TABLE "Item" DROP COLUMN "authorId",
ADD COLUMN     "userId" INTEGER;

-- AlterTable
ALTER TABLE "Vault" DROP COLUMN "authorId",
ADD COLUMN     "userId" INTEGER;

-- AddForeignKey
ALTER TABLE "Vault" ADD CONSTRAINT "Vault_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Item" ADD CONSTRAINT "Item_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
