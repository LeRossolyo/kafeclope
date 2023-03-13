import { Module } from '@nestjs/common';
import { KafesController } from './kafes.controller';
import { KafesService } from './kafes.service';

@Module({
  providers: [KafesService],
  exports: [KafesService],
  controllers: [KafesController]
})
export class UsersModule {}
