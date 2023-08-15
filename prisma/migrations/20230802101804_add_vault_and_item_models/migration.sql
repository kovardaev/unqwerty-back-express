-- DropIndex
DROP INDEX "User_password_key";

-- CreateTable
CREATE TABLE "Vault" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Vault_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Item" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "title" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "website" TEXT NOT NULL,
    "notes" TEXT NOT NULL,

    CONSTRAINT "Item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ItemToVault" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ItemToVault_AB_unique" ON "_ItemToVault"("A", "B");

-- CreateIndex
CREATE INDEX "_ItemToVault_B_index" ON "_ItemToVault"("B");

-- AddForeignKey
ALTER TABLE "_ItemToVault" ADD CONSTRAINT "_ItemToVault_A_fkey" FOREIGN KEY ("A") REFERENCES "Item"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ItemToVault" ADD CONSTRAINT "_ItemToVault_B_fkey" FOREIGN KEY ("B") REFERENCES "Vault"("id") ON DELETE CASCADE ON UPDATE CASCADE;
