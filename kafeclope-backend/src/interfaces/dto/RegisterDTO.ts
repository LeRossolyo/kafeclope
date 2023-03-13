import { BadRequestException } from "@nestjs/common";
import { IsEmail, IsEnum, IsOptional, IsPhoneNumber, IsString, IsStrongPassword, registerDecorator, ValidationArguments, ValidationOptions } from "class-validator";
import { cp } from "fs";
import { dataSource } from "src/database.module";
import { User } from "src/entities/user.entity";
import { BaseEntity, EntityTarget, ObjectLiteral, ObjectType } from "typeorm";

export class RegisterDTO {
  @IsUnique('email', User)
  @IsEmail()
  email: string;

  @IsUnique('handle', User)
  @IsString()
  handle: string;

  @IsString()
  username: string;

  // @IsStrongPassword()
  password: string;

  // @IsOptional()
  // @IsPhoneNumber()
  // @IsUnique('phone', User)
  // phone: string;

  @IsOptional()
  picture?: string;

  // @IsEnum(UserTypeEnum)
  // type?: UserTypeEnum;
}

export function IsUnique<T extends ObjectLiteral>(property: string, target: EntityTarget<T>, validationOptions?: ValidationOptions) {
  return function (object: Object, propertyName: string) {
    registerDecorator({
      name: 'IsUnique',
      target: object.constructor,
      propertyName: propertyName,
      constraints: [property],
      options: validationOptions,
      validator: {
        async validate(value: any, args: ValidationArguments) {
          try {
            const query = dataSource.getRepository(target).createQueryBuilder('item').where(`item.${property} = :value`, { value });

            const result = await query.getOne();

            if (result !== null) {
              throw new BadRequestException(`${property} with value ${value} already exists`);
            }

            return true;
          } catch (error) {
            if (error instanceof BadRequestException) {
              throw error;
            }
            return false;
          }
        },
      },
    });
  };
}