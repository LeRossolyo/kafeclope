
import { ExtractJwt, Strategy } from 'passport-jwt';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable } from '@nestjs/common';
import { Request } from 'express';
import { JwtUtil } from 'src/utils/cookies.util';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy, 'jwt') {
    constructor() {
        super({
            jwtFromRequest: (req: Request) => JwtUtil.extractJWT(req),
            secretOrKey: process.env.JWT_SECRET,
            issuer: process.env.JWT_ISSUER
        });
    }

    async validate(payload: any) {
        console.log(payload)
        return { id: payload.sub, username: payload.username };
    }
}
