import { MigrationInterface, QueryRunner } from "typeorm";

export class addUsersKafeRequestsRelation1674844595261 implements MigrationInterface {
    name = 'addUsersKafeRequestsRelation1674844595261'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "users_kafe_requests_kafe_requests" ("usersId" integer NOT NULL, "kafeRequestsId" integer NOT NULL, CONSTRAINT "PK_149230613dde92002b8f513cfff" PRIMARY KEY ("usersId", "kafeRequestsId"))`);
        await queryRunner.query(`CREATE INDEX "IDX_6507c7fd061417df3c0b311431" ON "users_kafe_requests_kafe_requests" ("usersId") `);
        await queryRunner.query(`CREATE INDEX "IDX_6956081339f881afb9558b711d" ON "users_kafe_requests_kafe_requests" ("kafeRequestsId") `);
        await queryRunner.query(`ALTER TABLE "kafe_requests" ADD "owner_id" integer`);
        await queryRunner.query(`ALTER TABLE "kafe_requests" ADD CONSTRAINT "FK_2c94b2c212ea3932f510b1b5ced" FOREIGN KEY ("owner_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE "users_kafe_requests_kafe_requests" ADD CONSTRAINT "FK_6507c7fd061417df3c0b3114318" FOREIGN KEY ("usersId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE "users_kafe_requests_kafe_requests" ADD CONSTRAINT "FK_6956081339f881afb9558b711d8" FOREIGN KEY ("kafeRequestsId") REFERENCES "kafe_requests"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "users_kafe_requests_kafe_requests" DROP CONSTRAINT "FK_6956081339f881afb9558b711d8"`);
        await queryRunner.query(`ALTER TABLE "users_kafe_requests_kafe_requests" DROP CONSTRAINT "FK_6507c7fd061417df3c0b3114318"`);
        await queryRunner.query(`ALTER TABLE "kafe_requests" DROP CONSTRAINT "FK_2c94b2c212ea3932f510b1b5ced"`);
        await queryRunner.query(`ALTER TABLE "kafe_requests" DROP COLUMN "owner_id"`);
        await queryRunner.query(`DROP INDEX "public"."IDX_6956081339f881afb9558b711d"`);
        await queryRunner.query(`DROP INDEX "public"."IDX_6507c7fd061417df3c0b311431"`);
        await queryRunner.query(`DROP TABLE "users_kafe_requests_kafe_requests"`);
    }

}
