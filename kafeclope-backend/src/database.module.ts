import { Module } from '@nestjs/common';
import { join } from 'path';
import { DataSource } from 'typeorm';

const databaseProviders = [
  {
    provide: 'DATA_SOURCE',
    useFactory: async () => {
      const dataSource = new DataSource({
        type: 'postgres',
        host: 'kafeclope-postgres',
        port: 5432,
        username: 'postgres',
        password: 'postgres',
        database: 'postgres',
        entities: [join(__dirname, '../../src/entity/**/*.entity.{ts,js}')],
        migrations: [join(__dirname, "src/migrations/**/", "*{.ts,.js}")],
        // synchronize: true,
      });

      return dataSource.initialize();
    },
  },
];

@Module({
  providers: [...databaseProviders],
  exports: [...databaseProviders]
})
export class DatabaseModule { }