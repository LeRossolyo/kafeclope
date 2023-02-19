import { MigrationInterface, QueryRunner } from "typeorm";

export class modUserTypeEnum1675944745117 implements MigrationInterface {
    name = 'modUserTypeEnum1675944745117'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TYPE "public"."users_usertype_enum" RENAME TO "users_usertype_enum_old"`);
        await queryRunner.query(`CREATE TYPE "public"."users_usertype_enum" AS ENUM('google', 'github', 'facebook', 'instagram', 'regular')`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" DROP DEFAULT`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" TYPE "public"."users_usertype_enum" USING "userType"::"text"::"public"."users_usertype_enum"`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" SET DEFAULT 'regular'`);
        await queryRunner.query(`DROP TYPE "public"."users_usertype_enum_old"`);
        await queryRunner.query(`ALTER TYPE "public"."users_usertype_enum" RENAME TO "users_usertype_enum_old"`);
        await queryRunner.query(`CREATE TYPE "public"."users_usertype_enum" AS ENUM('google', 'github', 'facebook', 'instagram', 'regular')`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" DROP DEFAULT`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" TYPE "public"."users_usertype_enum" USING "userType"::"text"::"public"."users_usertype_enum"`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" SET DEFAULT 'regular'`);
        await queryRunner.query(`DROP TYPE "public"."users_usertype_enum_old"`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TYPE "public"."users_usertype_enum_old" AS ENUM('0', '1', '2', '3', '4')`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" DROP DEFAULT`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" TYPE "public"."users_usertype_enum_old" USING "userType"::"text"::"public"."users_usertype_enum_old"`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" SET DEFAULT '4'`);
        await queryRunner.query(`DROP TYPE "public"."users_usertype_enum"`);
        await queryRunner.query(`ALTER TYPE "public"."users_usertype_enum_old" RENAME TO "users_usertype_enum"`);
        await queryRunner.query(`CREATE TYPE "public"."users_usertype_enum_old" AS ENUM('0', '1', '2', '3', '4')`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" DROP DEFAULT`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" TYPE "public"."users_usertype_enum_old" USING "userType"::"text"::"public"."users_usertype_enum_old"`);
        await queryRunner.query(`ALTER TABLE "users" ALTER COLUMN "userType" SET DEFAULT '4'`);
        await queryRunner.query(`DROP TYPE "public"."users_usertype_enum"`);
        await queryRunner.query(`ALTER TYPE "public"."users_usertype_enum_old" RENAME TO "users_usertype_enum"`);
    }

}
