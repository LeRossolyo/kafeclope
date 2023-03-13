import { Module } from '@nestjs/common';
import { FirendshipsController } from './friendship.controller';
import { FirendshipsService } from './friendships.service';

@Module({
  providers: [FirendshipsService],
  exports: [FirendshipsService],
  controllers: [FirendshipsController]
})
export class UsersModule {}
