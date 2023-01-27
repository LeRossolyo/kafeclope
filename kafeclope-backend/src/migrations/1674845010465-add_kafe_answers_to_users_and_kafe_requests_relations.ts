import { MigrationInterface, QueryRunner } from "typeorm";

export class addKafeAnswersToUsersAndKafeRequestsRelations1674845010465 implements MigrationInterface {
    name = 'addKafeAnswersToUsersAndKafeRequestsRelations1674845010465'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "kafe_answers" ADD "user_id" integer`);
        await queryRunner.query(`ALTER TABLE "kafe_answers" ADD "kafe_answer_id" integer`);
        await queryRunner.query(`ALTER TABLE "kafe_answers" ADD CONSTRAINT "FK_3490a9767a146c19884944dd2d8" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE "kafe_answers" ADD CONSTRAINT "FK_c71205fc0d75f48c4cd63a3a15d" FOREIGN KEY ("kafe_answer_id") REFERENCES "kafe_requests"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "kafe_answers" DROP CONSTRAINT "FK_c71205fc0d75f48c4cd63a3a15d"`);
        await queryRunner.query(`ALTER TABLE "kafe_answers" DROP CONSTRAINT "FK_3490a9767a146c19884944dd2d8"`);
        await queryRunner.query(`ALTER TABLE "kafe_answers" DROP COLUMN "kafe_answer_id"`);
        await queryRunner.query(`ALTER TABLE "kafe_answers" DROP COLUMN "user_id"`);
    }

}
