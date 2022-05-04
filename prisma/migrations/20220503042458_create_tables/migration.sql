/*
  Warnings:

  - You are about to drop the `Produtos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `product` on the `Vendas` table. All the data in the column will be lost.
  - Added the required column `produtoId` to the `Vendas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuarioId` to the `Vendas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `data_criacao` to the `usuarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `senha` to the `usuarios` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Produtos";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "produtos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "preco" DECIMAL NOT NULL,
    "estoque" INTEGER NOT NULL DEFAULT 0,
    "data_criacao" TEXT NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Vendas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "produtoId" INTEGER NOT NULL,
    "usuarioId" INTEGER NOT NULL,
    "client" TEXT NOT NULL,
    "datavenda" TEXT NOT NULL,
    CONSTRAINT "Vendas_produtoId_fkey" FOREIGN KEY ("produtoId") REFERENCES "produtos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Vendas_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Vendas" ("client", "datavenda", "id") SELECT "client", "datavenda", "id" FROM "Vendas";
DROP TABLE "Vendas";
ALTER TABLE "new_Vendas" RENAME TO "Vendas";
CREATE TABLE "new_usuarios" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "data_criacao" TEXT NOT NULL
);
INSERT INTO "new_usuarios" ("email", "id", "nome", "telefone") SELECT "email", "id", "nome", "telefone" FROM "usuarios";
DROP TABLE "usuarios";
ALTER TABLE "new_usuarios" RENAME TO "usuarios";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
