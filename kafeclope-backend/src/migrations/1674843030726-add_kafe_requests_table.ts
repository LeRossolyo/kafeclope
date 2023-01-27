import { MigrationInterface, QueryRunner } from "typeorm";

export class addKafeRequestsTable1674843030726 implements MigrationInterface {
    name = 'addKafeRequestsTable1674843030726'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "kafe_requests" ("id" SERIAL NOT NULL, "created_at" TIMESTAMP NOT NULL DEFAULT now(), CONSTRAINT "PK_53efba71db82f3aa18c44e3248f" PRIMARY KEY ("id"))`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP TABLE "kafe_requests"`);
    }

}
