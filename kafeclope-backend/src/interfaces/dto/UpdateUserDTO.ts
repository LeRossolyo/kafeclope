import { IsOptional, IsString } from "class-validator";

export class UpdateUserDTO {
    @IsString()
    @IsOptional()
    email: string

    @IsOptional()
    username: string

    @IsOptional()
    password: string
};