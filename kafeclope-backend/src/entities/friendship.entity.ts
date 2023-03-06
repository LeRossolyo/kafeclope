import { BaseEntity, Column, CreateDateColumn, Entity, ManyToMany, PrimaryGeneratedColumn } from "typeorm";
import { User } from "./user.entity";

@Entity({
    name: 'friendships'
})
export class Friendship extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @CreateDateColumn({
        name: 'created_at',
    })
    createdAt: Date;

    @Column({
        default: false
    })
    status: boolean

    @ManyToMany(() => User, (user) => user.friendships)
    users: User[];
}