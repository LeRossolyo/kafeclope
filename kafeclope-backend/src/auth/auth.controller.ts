import { Body, Controller, Post, Query, Req, Request, Res, UseGuards } from '@nestjs/common';
import { Request as ExpressRequest, Response } from 'express';
import { AuthenticateDTO } from 'src/interfaces/dto/AuthenticateDTO';
import { RegisterDTO } from 'src/interfaces/dto/RegisterDTO';
import { AuthCredentials } from 'src/interfaces/AuthCredentials';
import { AuthService } from './auth.service';
import { RefreshGuard } from './refresh.guard';
import { User } from 'src/entities/user.entity';
import { DeepPartial } from 'typeorm';
import { RequestAuthenticated } from 'src/interfaces/RequestAuthenticated';

@Controller('auth')
export class AuthController {
    constructor(private authService: AuthService) { }

    @Post('register')
    async register(@Body() dto: RegisterDTO, @Res() res: Response) {
        return this.authService.register(dto, res);
    }

    @Post('authenticate')
    async authenticate(@Body() dto: AuthenticateDTO, @Res() res: Response) {
        return this.authService.authenticate(dto, res);
    }

    @UseGuards(RefreshGuard)
    @Post('refresh')
    async refresh(@Request() req: RequestAuthenticated, @Res() res: Response) {
        return this.authService.refresh(req.user, res);
    }

    @Post('sign-out')
    async signOut(@Res() res: Response) {
        return this.authService.signOut(res);
    }
}
