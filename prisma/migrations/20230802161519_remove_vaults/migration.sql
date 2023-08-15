/*
  Warnings:

  - You are about to drop the column `isFavorite` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the `Vault` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ItemToVault` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Vault" DROP CONSTRAINT "Vault_userId_fkey";

-- DropForeignKey
ALTER TABLE "_ItemToVault" DROP CONSTRAINT "_ItemToVault_A_fkey";

-- DropForeignKey
ALTER TABLE "_ItemToVault" DROP CONSTRAINT "_ItemToVault_B_fkey";

-- AlterTable
ALTER TABLE "Item" DROP COLUMN "isFavorite",
ADD COLUMN     "folders" TEXT[];

-- DropTable
DROP TABLE "Vault";

-- DropTable
DROP TABLE "_ItemToVault";
