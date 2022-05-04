/*
  Warnings:

  - You are about to drop the `produtos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `vendas` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "produtos";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "vendas";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Produtos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "estoque_id" TEXT NOT NULL,
    "preco" DECIMAL NOT NULL,
    "estoque" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Vendas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "product" TEXT NOT NULL,
    "client" TEXT NOT NULL,
    "datavenda" TEXT NOT NULL
);
