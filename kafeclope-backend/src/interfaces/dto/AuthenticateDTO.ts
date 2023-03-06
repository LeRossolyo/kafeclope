import { IsString } from "class-validator";

export class AuthenticateDTO {
  @IsString()
  identifier: string;
  @IsString()
  password: string;
}