import { MigrationInterface, QueryRunner } from "typeorm";

export class addUsersFriendshipsRelation1674844021571 implements MigrationInterface {
    name = 'addUsersFriendshipsRelation1674844021571'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "users_friendships_friendships" ("usersId" integer NOT NULL, "friendshipsId" integer NOT NULL, CONSTRAINT "PK_287c3124020d1205ecd59a43bfe" PRIMARY KEY ("usersId", "friendshipsId"))`);
        await queryRunner.query(`CREATE INDEX "IDX_fb9588a49915c278d40e871faf" ON "users_friendships_friendships" ("usersId") `);
        await queryRunner.query(`CREATE INDEX "IDX_481ee27477fee5f7726975f9a5" ON "users_friendships_friendships" ("friendshipsId") `);
        await queryRunner.query(`ALTER TABLE "users_friendships_friendships" ADD CONSTRAINT "FK_fb9588a49915c278d40e871faf7" FOREIGN KEY ("usersId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE "users_friendships_friendships" ADD CONSTRAINT "FK_481ee27477fee5f7726975f9a54" FOREIGN KEY ("friendshipsId") REFERENCES "friendships"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "users_friendships_friendships" DROP CONSTRAINT "FK_481ee27477fee5f7726975f9a54"`);
        await queryRunner.query(`ALTER TABLE "users_friendships_friendships" DROP CONSTRAINT "FK_fb9588a49915c278d40e871faf7"`);
        await queryRunner.query(`DROP INDEX "public"."IDX_481ee27477fee5f7726975f9a5"`);
        await queryRunner.query(`DROP INDEX "public"."IDX_fb9588a49915c278d40e871faf"`);
        await queryRunner.query(`DROP TABLE "users_friendships_friendships"`);
    }

}
