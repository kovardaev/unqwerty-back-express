/*
  Warnings:

  - You are about to drop the column `folders` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `notes` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `website` on the `Item` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Item" DROP COLUMN "folders",
DROP COLUMN "notes",
DROP COLUMN "website";
