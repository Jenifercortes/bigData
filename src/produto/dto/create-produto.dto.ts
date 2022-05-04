// export type CreateProdutoDto = {
//   nome: string;
//   quantidade: number;

import { Decimal } from '@prisma/client/runtime';

// }
export class CreateProdutoDto {
  public id: number;
  public nome: string;
  public quantidade: number;
  public preco: Decimal;
}
