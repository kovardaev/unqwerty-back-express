/*
  Warnings:

  - You are about to drop the `_ItemToUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_UserToVault` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ItemToUser" DROP CONSTRAINT "_ItemToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_ItemToUser" DROP CONSTRAINT "_ItemToUser_B_fkey";

-- DropForeignKey
ALTER TABLE "_UserToVault" DROP CONSTRAINT "_UserToVault_A_fkey";

-- DropForeignKey
ALTER TABLE "_UserToVault" DROP CONSTRAINT "_UserToVault_B_fkey";

-- AlterTable
ALTER TABLE "Item" ADD COLUMN     "authorId" INTEGER;

-- AlterTable
ALTER TABLE "Vault" ADD COLUMN     "authorId" INTEGER;

-- DropTable
DROP TABLE "_ItemToUser";

-- DropTable
DROP TABLE "_UserToVault";

-- AddForeignKey
ALTER TABLE "Vault" ADD CONSTRAINT "Vault_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Item" ADD CONSTRAINT "Item_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
