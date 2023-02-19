import { PassportStrategy } from '@nestjs/passport';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { Strategy } from 'passport-jwt';
import { Request } from 'express';
import { CookiesUtil } from 'src/utils/cookies.util';
import { DecodedJWT } from 'src/interfaces/DecodedJWT';
import { User } from 'src/entities/user.entity';
import { UsersService } from 'src/users/users.service';

@Injectable()
export class RefreshTokenStrategy extends PassportStrategy(Strategy, 'jwt-refresh') {
  constructor(private usersService: UsersService) {
    super({
      jwtFromRequest: (req: Request) => CookiesUtil.extractCookie(req, 'refresh_token'),
      secretOrKey: process.env.JWT_REFRESH_SECRET,
      issuer: process.env.JWT_ISSUER,
    });
  }

  async validate(payload: DecodedJWT): Promise<User> {
    try {
      const user = await this.usersService.findOne({id: payload.sub});

      return user;
    } catch (error) {
      console.error(error);
      throw new UnauthorizedException();
    }
  }
}