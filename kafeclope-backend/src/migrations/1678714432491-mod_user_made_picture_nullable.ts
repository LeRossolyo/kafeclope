import { MigrationInterface, QueryRunner } from "typeorm";

export class modUserMadePictureNullable1678714432491 implements MigrationInterface {
    name = 'modUserMadePictureNullable1678714432491'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "users" DROP COLUMN "picture"`);
        await queryRunner.query(`ALTER TABLE "users" ADD "picture" character varying`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "users" DROP COLUMN "picture"`);
        await queryRunner.query(`ALTER TABLE "users" ADD "picture" bytea NOT NULL`);
    }

}
