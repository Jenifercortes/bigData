import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/database/prisma.service';
import { CreateVendaDto } from './dto/create-venda.dto';
import { FilterDateDto } from './dto/filter-date.dto';
import { UpdateVendaDto } from './dto/update-venda.dto';

@Injectable()
export class VendaService {
  prisma: any;
  constructor(private readonly prismaService: PrismaService) {}

  async create(createVendaDto: CreateVendaDto) {
    //validar se a quantidade do produto ainda esta disponivel na tabela produto
    const produto = await this.prismaService.produto.findFirst({
      where: { id: createVendaDto.produtoId },
    });

    if (produto.quantidade < createVendaDto.quantidade) {
      //retornar um erro porque o produto tem uma quantidade menor em estoque do que solicitada para venda
      throw new Error(
        'Quantidade solicitada maior que a disponível em estoque.',
      );
    }

    //atualizar o valor do produto no estoque
    const novoProduto = await this.prismaService.produto.update({
      where: { id: createVendaDto.produtoId },
      data: {
        quantidade: produto.quantidade - createVendaDto.quantidade,
      },
    });

    //criar a venda
    return await this.prismaService.vendas.create({
      data: createVendaDto,
    });
  }

  findAll() {
    return `This action returns all venda`;
  }

  async findByUserIdAndDate(dto: FilterDateDto) {
    const timeStamp = new Date(dto.date)
      .toISOString()
      .slice(0, 19)
      .replace('T', ' ');

    const vendas = await this.prismaService.vendas.findFirst({
      where: { usuarioId: dto.usuarioId, datavenda: '1651640883105' },
    });

    console.log('resultado:');
    console.log(vendas);

    return vendas;
  }

  findOne(id: number) {
    return `This action returns a #${id} venda`;
  }

  async update(venda: CreateVendaDto) {
    return await this.prismaService.produto.update({
      where: { id: venda.id },
      data: venda,
    });
  }

  async remove(id: number) {
    const post = await this.prismaService.produto.delete({
      where: { id: Number(id) },
    });
  }
}
