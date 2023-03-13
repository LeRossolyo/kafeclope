import { Controller, Delete, Get, Patch, Post } from "@nestjs/common";

@Controller('friendships')
export class FirendshipsController {

    @Get()
    getFirendshipsRequest(): string{
        return "get_firend_request"
    }

    @Post()
    sendFirendshipsRequest(): string{
        return "Send_firend_request"
    }

    @Patch()
    updateFirendshipsRequest(): string{
        return "update_firend_request"
    }

    @Get()
    getFirendships(): string{
        return "get_friendship"
    }

    @Get()
    searchFirendships(): string{
        return "search_friendship"
    }

    @Delete()
    delteFirendships(): string{
        return "delete_friendship"
    }

    
}