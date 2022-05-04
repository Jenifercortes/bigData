import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { VendaService } from './venda.service';
import { CreateVendaDto } from './dto/create-venda.dto';
import { UpdateVendaDto } from './dto/update-venda.dto';
import { FilterDateDto } from './dto/filter-date.dto';

@Controller('venda')
export class VendaController {
  constructor(private readonly vendaService: VendaService) {}

  @Post()
  create(@Body() createVendaDto: CreateVendaDto) {
    return this.vendaService.create(createVendaDto);
  }

  @Get()
  findAll() {
    return this.vendaService.findAll();
  }

  @Post('filter-date')
  findByUserIdAndDate(@Body() filterDateDto: FilterDateDto) {
    return this.vendaService.findByUserIdAndDate(filterDateDto);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.vendaService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateVendaDto: UpdateVendaDto) {
    // return this.vendaService.update(+id, updateVendaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.vendaService.remove(+id);
  }
}
