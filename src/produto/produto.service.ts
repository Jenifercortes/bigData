import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/database/prisma.service';
import { CreateProdutoDto } from './dto/create-produto.dto';
import { UpdateProdutoDto } from './dto/update-produto.dto';

@Injectable()
export class ProdutoService {
  constructor(private prisma: PrismaService) {}

  async create(createProdutoDto: CreateProdutoDto) {
    const produtoExist = await this.prisma.produto.findFirst({
      where: { nome: createProdutoDto.nome },
    });

    if (produtoExist) {
      throw new Error('Este produto já existe');
    }

    return this.prisma.produto.create({
      data: {
        nome: createProdutoDto.nome,
        quantidade: createProdutoDto.quantidade,
        preco: createProdutoDto.preco,
      },
    });
  }

  async findAll() {
    return await this.prisma.produto.findMany();
  }

  async findOne(id: number) {
    const product = await this.prisma.produto.findFirst({
      where: { id: id },
    });

    if (!product) {
      throw new Error('Este produto não existe');
    }

    return product;
  }

  async update(produto: UpdateProdutoDto) {
    return await this.prisma.produto.update({
      where: { id: produto.id },
      data: produto,
    });
  }

  async remove(id: number) {
    const post = await this.prisma.produto.delete({
      where: { id: Number(id) },
    });
  }
}
