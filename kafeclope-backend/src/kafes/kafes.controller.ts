import { Controller, Get, Post, Put } from "@nestjs/common";

@Controller('kafes')
export class KafesController {

    @Get()
    getKafeData(): string {
        return "Get kaffé info"
    }

    @Post()
    createKafe(): string {
        return "create kafé"
    }

    @Put()
    answerKafe(): string {
        return "answer kafé"
    }

    @Get()
    getHistoric(): string {
        return "get kafé"
    }
}