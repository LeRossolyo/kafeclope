import { Module } from '@nestjs/common';
import { UsersModule } from 'src/users/users.module';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { JwtModule, JwtService } from '@nestjs/jwt';
import { JwtStrategy } from './jwt.strategy';
import { RefreshTokenStrategy } from './refresh.strategy';
import { ConfigModule, ConfigService } from '@nestjs/config';

@Module({
  imports: [UsersModule, JwtModule.registerAsync({
    imports: [ConfigModule],
    useFactory: async (configService: ConfigService) => ({
      signOptions: {
        expiresIn: configService.get('JWT_EXPIRATION_TIME'),
        issuer: configService.get('JWT_ISSUER'),
      },
      secret: configService.get('JWT_SECRET'),
    }),
    inject: [ConfigService],
  })],
  providers: [AuthService, JwtStrategy, RefreshTokenStrategy],
  controllers: [AuthController]
})
export class AuthModule { }