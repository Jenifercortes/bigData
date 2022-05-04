/*
  Warnings:

  - You are about to drop the column `estoque` on the `produtos` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_produtos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "preco" DECIMAL NOT NULL,
    "quantidade" INTEGER NOT NULL DEFAULT 0,
    "data_criacao" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_produtos" ("data_criacao", "id", "nome", "preco") SELECT "data_criacao", "id", "nome", "preco" FROM "produtos";
DROP TABLE "produtos";
ALTER TABLE "new_produtos" RENAME TO "produtos";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
