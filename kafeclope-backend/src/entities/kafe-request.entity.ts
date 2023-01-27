import { BaseEntity, CreateDateColumn, Entity, JoinColumn, ManyToMany, ManyToOne, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { KafeAnswer } from "./kafe-answers.entity";
import { User } from "./user.entity";

@Entity({
    name: 'kafe_requests'
})
export class KafeRequest extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @CreateDateColumn({
        name: 'created_at'
    })
    createdAt: Date;

    @ManyToOne(() => User)
    @JoinColumn({name: 'owner_id'})
    owner: User;

    @ManyToMany(() => User, (user) => user.kafeRequests)
    users: User[];

    @OneToMany(() => KafeAnswer, (answer) => answer.request)
    answers: KafeAnswer[];
}