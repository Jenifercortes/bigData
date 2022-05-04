-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_vendas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "produtoId" INTEGER NOT NULL,
    "usuarioId" INTEGER NOT NULL,
    "datavenda" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "quantidade" INTEGER NOT NULL DEFAULT 1,
    CONSTRAINT "vendas_produtoId_fkey" FOREIGN KEY ("produtoId") REFERENCES "produtos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "vendas_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_vendas" ("datavenda", "id", "produtoId", "usuarioId") SELECT "datavenda", "id", "produtoId", "usuarioId" FROM "vendas";
DROP TABLE "vendas";
ALTER TABLE "new_vendas" RENAME TO "vendas";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
