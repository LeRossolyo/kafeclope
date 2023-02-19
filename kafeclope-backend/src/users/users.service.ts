import { Injectable } from '@nestjs/common';
import { hash } from 'bcrypt';
import { User } from 'src/entities/user.entity';
import { RegisterDTO } from 'src/interfaces/dto/RegisterDTO';
import { EntityNotFoundError, FindOptionsWhere } from 'typeorm';

@Injectable()
export class UsersService {
  constructor() { }

  async findOne(where: FindOptionsWhere<User>): Promise<User> {
    const user = await User.findOne({ where });

    if (user === null) {
      throw new EntityNotFoundError(User, where);
    }

    return user;
  }

  async create(dto: RegisterDTO) {


    const user = User.create({ ...dto, userType: dto.type, password: await hash(dto.password, 10) });

    await user.save();

    return user;
  }
}
