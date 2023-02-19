import { Module } from '@nestjs/common';
import { join } from 'path';
import { DataSource } from 'typeorm';

export const dataSource = new DataSource({
  type: 'postgres',
  host: 'kafeclope-postgres',
  port: 5432,
  username: 'postgres',
  password: 'postgres',
  database: 'postgres',
  entities: [join(__dirname, '**', '*.entity.{ts,js}')],
  migrations: [join(__dirname, "src/migrations/**/", "*{.ts,.js}")],
  // synchronize: true,
});

const databaseProviders = [
  {
    provide: 'DATA_SOURCE',
    useFactory: async () => dataSource.initialize()
  },
];

@Module({
  providers: [...databaseProviders],
  exports: [...databaseProviders]
})
export class DatabaseModule { }