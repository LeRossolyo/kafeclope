import { Injectable, InternalServerErrorException, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { compare } from 'bcrypt';
import { Response } from 'express';
import { User } from 'src/entities/user.entity';
import { AuthenticateDTO } from 'src/interfaces/dto/AuthenticateDTO';
import { RegisterDTO } from 'src/interfaces/dto/RegisterDTO';
import { AuthCredentials } from 'src/interfaces/AuthCredentials';
import { UsersService } from 'src/users/users.service';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class AuthService {
  constructor(private usersService: UsersService, private jwtService: JwtService, private configService: ConfigService) { }

  private async _validateUser(email: string, pass: string): Promise<User | null> {
    try {
      const user = await User.createQueryBuilder()
        .where(`username=:value`, { value: email })
        .orWhere(`email=:value`, { value: email })
        .getOne();

      if (user instanceof User && await compare(pass, user.password)) {
        return user;
      }
      return null;
    } catch (e) {
      console.error(e);
      return null;
    }
  }

  // private _withAuthCookies(res: Response, payload: AuthCredentials, statusCode?: number): Response {
  //   res.cookie('access_token', payload.accessToken, {
  //     httpOnly: true,
  //   });

  //   res.cookie('refresh_token', payload.refreshToken, {
  //     httpOnly: true,
  //   });

  //   res.statusCode = statusCode ?? 200;

  //   return res.send();
  // }

  private async _getCredentials(user: User): Promise<AuthCredentials> {
    const payload = { username: user.username, sub: user.id };

    return {
      accessToken: await this.jwtService.signAsync(payload),
      refreshToken: await this.jwtService.signAsync({ sub: payload.sub }, { secret: this.configService.get('JWT_REFRESH_SECRET'), expiresIn: this.configService.get('JWT_REFRESH_EXPIRATION_TIME') })
    }
  }


  private _sendCredentials(res: Response, payload: AuthCredentials, statusCode?: number): Response {
    res.statusCode = statusCode ?? 200;

    return res.send(payload);
  }

  async register(dto: RegisterDTO, res: Response): Promise<Response> {
    try {
      const user = await this.usersService.create(dto);
      const payload = await this._getCredentials(user);

      return this._sendCredentials(res, payload);
    } catch (error) {
      console.error(error);
      throw new InternalServerErrorException('An unexpected error occured');
    }
  }

  async authenticate(dto: AuthenticateDTO, res: Response): Promise<Response> {
    const user = await this._validateUser(dto.email, dto.password);

    if (user === null) {
      throw new UnauthorizedException('Invalid credentials');
    }


    const payload = await this._getCredentials(user);

    return this._sendCredentials(res, payload);
  }

  async refresh(user: User, res: Response) {
    const payload = await this._getCredentials(user);

    return this._sendCredentials(res, payload, 204);
  }

  async signOut(res: Response) {
    res.cookie('access_token', '', {expires: new Date(0)});
    res.cookie('refresh_token', '', {expires: new Date(0)});

    res.statusCode = 205;
    return res.send();
  }
}
