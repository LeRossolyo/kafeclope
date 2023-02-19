import { Request } from "express";
import { User } from "src/entities/user.entity";

export interface RequestAuthenticated extends Request {
  user: User;
}