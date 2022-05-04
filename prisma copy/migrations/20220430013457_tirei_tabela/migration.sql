/*
  Warnings:

  - You are about to drop the `estoque` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `estoque` to the `produtos` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "estoque";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_produtos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "estoque_id" TEXT NOT NULL,
    "preco" DECIMAL NOT NULL,
    "estoque" INTEGER NOT NULL
);
INSERT INTO "new_produtos" ("estoque_id", "id", "nome", "preco") SELECT "estoque_id", "id", "nome", "preco" FROM "produtos";
DROP TABLE "produtos";
ALTER TABLE "new_produtos" RENAME TO "produtos";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
