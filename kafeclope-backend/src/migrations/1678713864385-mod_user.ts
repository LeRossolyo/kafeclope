import { MigrationInterface, QueryRunner } from "typeorm";

export class modUser1678713864385 implements MigrationInterface {
    name = 'modUser1678713864385'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "users" DROP CONSTRAINT "UQ_a000cca60bcf04454e727699490"`);
        await queryRunner.query(`ALTER TABLE "users" DROP COLUMN "phone"`);
        await queryRunner.query(`ALTER TABLE "users" DROP COLUMN "userType"`);
        await queryRunner.query(`DROP TYPE "public"."users_usertype_enum"`);
        await queryRunner.query(`ALTER TABLE "users" ADD "handle" character varying NOT NULL`);
        await queryRunner.query(`ALTER TABLE "users" ADD CONSTRAINT "UQ_6a7e5f591436179c411f5308a9e" UNIQUE ("handle")`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "users" DROP CONSTRAINT "UQ_6a7e5f591436179c411f5308a9e"`);
        await queryRunner.query(`ALTER TABLE "users" DROP COLUMN "handle"`);
        await queryRunner.query(`CREATE TYPE "public"."users_usertype_enum" AS ENUM('google', 'github', 'facebook', 'instagram', 'regular')`);
        await queryRunner.query(`ALTER TABLE "users" ADD "userType" "public"."users_usertype_enum" NOT NULL DEFAULT 'regular'`);
        await queryRunner.query(`ALTER TABLE "users" ADD "phone" character varying NOT NULL`);
        await queryRunner.query(`ALTER TABLE "users" ADD CONSTRAINT "UQ_a000cca60bcf04454e727699490" UNIQUE ("phone")`);
    }

}
