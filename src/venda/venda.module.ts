import { Module } from '@nestjs/common';
import { VendaService } from './venda.service';
import { VendaController } from './venda.controller';
import { PrismaService } from 'src/database/prisma.service';

@Module({
  controllers: [VendaController],
  providers: [VendaService, PrismaService]
})
export class VendaModule {}
