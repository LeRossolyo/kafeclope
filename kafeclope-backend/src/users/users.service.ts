import { Injectable } from '@nestjs/common';
import { hash, hashSync } from 'bcrypt';
import { Response } from 'express';
import { AuthService } from 'src/auth/auth.service';
import { User } from 'src/entities/user.entity';
import { RegisterDTO } from 'src/interfaces/dto/RegisterDTO';
import { UpdateUserDTO } from 'src/interfaces/dto/UpdateUserDTO';
import { RequestAuthenticated } from 'src/interfaces/RequestAuthenticated';
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
    const user = User.create({ ...dto, password: await hash(dto.password, 10) });

    await user.save();
    return user;
  }

  async getData(req: RequestAuthenticated, res: Response): Promise<Response> {
    const user = await this.findOne({ id: req.user.id })

    const { id, ...user_data } = user;

    return res.send(user_data);
  }

  async updateData(req: RequestAuthenticated, body: UpdateUserDTO, res: Response): Promise<Response> {
    const newUser = await this.findOne({ id: req.user.id })

    newUser.email = body.email
    // newUser.sert({
    //   email: body.email,
    //   username: body.username,
    // })
    if (body.password) {
      const passwordHash = hashSync(body.password, 10);
      newUser.password = passwordHash;
    }
    await newUser.save()
    res.statusCode = 200;

    return res.send();
  }

  async deleteUser(req: RequestAuthenticated, res: Response): Promise<Response> {
    const options : FindOptionsWhere<User> = {id: req.user.id};
  
    await User.delete(options);
    res.statusCode = 200;

    return res.send()
  }
}
