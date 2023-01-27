import { MigrationInterface, QueryRunner } from "typeorm";

export class addFriendshipsTable1674842878413 implements MigrationInterface {
    name = 'addFriendshipsTable1674842878413'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "friendships" ("id" SERIAL NOT NULL, "created_at" TIMESTAMP NOT NULL DEFAULT now(), "status" boolean NOT NULL DEFAULT false, CONSTRAINT "PK_08af97d0be72942681757f07bc8" PRIMARY KEY ("id"))`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP TABLE "friendships"`);
    }

}
