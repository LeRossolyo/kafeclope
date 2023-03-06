const { join } = require("path");
const { DataSource } = require("typeorm");

exports.config = new DataSource({
    type: 'postgres',
    host: 'kafeclope-postgres',
    port: 5432,
    username: 'postgres',
    password: 'postgres',
    database: 'postgres',
    entities: [join(__dirname, '**', '*.entity.{ts,js}')],
    migrations: ["src/migrations/**/*{.ts,.js}"],
    cli: {
        "migrationsDir": "src/migrations"
    },
});