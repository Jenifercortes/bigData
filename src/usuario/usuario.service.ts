import { Injectable, Param } from '@nestjs/common';
import { PrismaService } from 'src/database/prisma.service';
import { CreateUsuarioDto } from './dto/create-usuario.dto';
import { UpdateUsuarioDto } from './dto/update-usuario.dto';
import * as bcrypt from 'bcrypt';
import { Prisma } from '@prisma/client';

@Injectable()
export class UsuarioService {
  constructor(private readonly prisma: PrismaService) {}

  async create(createUsuarioDto: CreateUsuarioDto) {
    const data: Prisma.UsuarioCreateInput = {
      ...createUsuarioDto,
      senha: await bcrypt.hash(createUsuarioDto.senha, 10),
    };

    // return 'This action adds a new usuario';
    const usuarioExiste = await this.prisma.usuario.findFirst({
      where: { email: createUsuarioDto.email },
    });

    if (usuarioExiste) {
      throw new Error('User exists');
    }

    const usuarioCriado = await this.prisma.usuario.create({ data });

    return {
      ...usuarioCriado,
      senha: undefined,
    };
  }

  async findAll() {
    return await this.prisma.usuario.findMany();
  }

  async findOne(id: number) {
    const usuario = await this.prisma.usuario.findFirst({
      where: { id: id },
    });

    if (!usuario) {
      throw new Error('Este usuário não existe.');
    }

    return usuario;
  }

  async update(usuario: UpdateUsuarioDto) {
    return await this.prisma.usuario.update({
      where: { id: usuario.id },
      data: usuario,
    });
  }

  async remove(id: Number) {
    const usuario = await this.prisma.usuario.delete({
      where: { id: Number(id) },
    });
  }
}
