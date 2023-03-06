import { BaseEntity, Column, Entity, JoinTable, ManyToMany, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Friendship } from "./friendship.entity";
import { KafeAnswer } from "./kafe-answers.entity";
import { KafeRequest } from "./kafe-request.entity";

export enum UserTypeEnum {
    GOOGLE,
    GITHUB,
    FACEBOOK,
    INSTAGRAM,
    REGULAR,
}

@Entity({
    name: 'users',

})
export class User extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    username: string;

    @Column({ unique: true })
    email: string;

    @Column()
    password: string;

    @Column({unique: true, nullable: true})
    phone: string;

    @Column('bytea')
    picture: string;

    @Column({
        type: "enum",
        enum: UserTypeEnum,
        default: UserTypeEnum.REGULAR
    })
    userType: UserTypeEnum;

    @ManyToMany(() => Friendship, (friendship) => friendship.users)
    @JoinTable()
    friendships: Friendship[];

    @ManyToMany(() => KafeRequest, (request) => request.users)
    @JoinTable()
    kafeRequests: KafeRequest[];

    @OneToMany(() => KafeAnswer, (answer) => answer.user)
    kafeAnswers: KafeAnswer[];
}