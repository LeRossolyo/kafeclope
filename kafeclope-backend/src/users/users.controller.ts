import { Body, Controller, Delete, Get, Patch, Post, Request, Res, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { Response } from 'express';
import { JwtAuthGuard } from 'src/auth/jwt.guard';
import { User } from 'src/entities/user.entity';
import { RequestAuthenticated } from 'src/interfaces/RequestAuthenticated';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
    constructor(private readonly usersService: UsersService) {}

    @Get('/data')
    @UseGuards(JwtAuthGuard)
    async getData(@Request() req: RequestAuthenticated, @Res() res: Response): Promise<Response> {
        return await this.usersService.getData(req, res);
    }

    @Patch('/data')
    @UseGuards(JwtAuthGuard)
    async updateData(@Request() req: RequestAuthenticated, @Res() res: Response): Promise<Response> {
        return await this.usersService.updateData(req, req.body, res)
    }

    @Delete()
    @UseGuards(JwtAuthGuard)
    async deleteUser(@Request() req: RequestAuthenticated, @Res() res: Response): Promise<Response> {
        return await this.usersService.deleteUser(req, res);
    }

    @Patch('/picture')
    register(): string {
        return "Profile Picture Update"
    }

    @Get('/search_all')
    searchAll(): string {
        return 'Search in all user'
    }
}
