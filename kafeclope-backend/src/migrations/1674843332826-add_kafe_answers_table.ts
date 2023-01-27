import { MigrationInterface, QueryRunner } from "typeorm";

export class addKafeAnswersTable1674843332826 implements MigrationInterface {
    name = 'addKafeAnswersTable1674843332826'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "kafe_answers" ("id" SERIAL NOT NULL, "created_at" TIMESTAMP NOT NULL DEFAULT now(), "answer" boolean NOT NULL, "message" character varying NOT NULL, CONSTRAINT "PK_41fab7987ebc78e4b57c0c1ad09" PRIMARY KEY ("id"))`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP TABLE "kafe_answers"`);
    }

}
