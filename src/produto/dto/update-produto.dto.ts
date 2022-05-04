import { Decimal } from '@prisma/client/runtime';

export class UpdateProdutoDto {
  public id: number;
  public nome: string;
  public quantidade: number;
  public preco: Decimal;
}
