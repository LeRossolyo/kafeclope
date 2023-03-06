import { MigrationInterface, QueryRunner } from "typeorm";

export class modUserPhoneNotNull1676378017930 implements MigrationInterface {
    name = 'modUserPhoneNotNull1676378017930'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "phone" SET NOT NULL`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "phone" SET NOT NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "phone" DROP NOT NULL`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "phone" DROP NOT NULL`);
    }

}
