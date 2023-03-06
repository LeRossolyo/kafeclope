import { BaseEntity, Column, CreateDateColumn, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { KafeRequest } from "./kafe-request.entity";
import { User } from "./user.entity";

@Entity({
    name: 'kafe_answers'
})
export class KafeAnswer extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @CreateDateColumn({
        name: 'created_at'
    })
    createdAt: Date;

    @Column()
    answer: boolean;

    @Column()
    message: string;

    @ManyToOne(() => User, (user) => user.kafeAnswers)
    @JoinColumn({ name: 'user_id' })
    user: User;

    @ManyToOne(() => KafeRequest, (request) => request.answers)
    @JoinColumn({ name: 'kafe_answer_id' })
    request: KafeRequest;
}