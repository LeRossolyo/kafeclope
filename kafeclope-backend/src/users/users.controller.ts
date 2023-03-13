import { Body, Controller, Delete, Get, Patch, Post } from '@nestjs/common';
import { User } from 'src/entities/user.entity';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
    constructor(private readonly appService: UsersService) {}

    @Get('/data')
    getData(): string {
        return "Get Current user data"
    }

    @Patch('/data')
    updateData(): string {
        return 'Update user data'
    }

    @Delete()
    deleteUser(): string {
        return 'delete User'
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
