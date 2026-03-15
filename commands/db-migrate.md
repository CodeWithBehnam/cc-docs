---
name: db-migrate
description: Generate a database migration file with up and down methods for the described change, then test rollback.
argument-hint: <migration description e.g. "add email index to users">
allowed-tools: Bash, Read, Grep, Glob
---

Create a database migration for: $ARGUMENTS

Follow these steps:

### Step 1 - Detect the migration framework
Check the project for:
- `alembic.ini` or `migrations/env.py` - Alembic (SQLAlchemy / Python)
- `db/migrate/` directory with Rails-style timestamps - ActiveRecord (Rails)
- `migrations/` with `*.sql` files - raw SQL migrations
- `knex` in `package.json` - Knex.js
- `sequelize` in `package.json` - Sequelize
- `prisma/migrations/` - Prisma
- `typeorm` in `package.json` - TypeORM
- `flyway.conf` or `V*.sql` files - Flyway
- `liquibase.properties` - Liquibase

Report which framework was detected before proceeding.

### Step 2 - Inspect existing migrations
Read 2-3 recent migration files to understand:
- Naming conventions (timestamp prefix, snake_case description, etc.)
- Code style and patterns used.
- How `up` and `down` methods are structured.

### Step 3 - Generate the migration file
Create the migration file following the exact naming and structural conventions of the project.

The migration must include:
- **Up**: the forward migration implementing "$ARGUMENTS".
- **Down**: a complete rollback that fully reverses the up migration.

For schema changes, consider:
- Adding/dropping columns: include column type, nullable, default value, and constraints.
- Adding indexes: specify columns, uniqueness, and name the index explicitly.
- Adding foreign keys: specify ON DELETE / ON UPDATE behavior.
- Data migrations: use batching if modifying large tables; never lock the whole table.

### Step 4 - Show the generated file
Print the full contents of the migration file and its path.

### Step 5 - Test the rollback
Run the up migration, then immediately run the down migration, then run the up migration again. Confirm all three steps succeed:
- `migrate up` (or equivalent)
- `migrate down` (or equivalent)
- `migrate up` again

If the migration framework is not runnable in the current environment, explain which commands to run manually.

### Step 6 - Summary
Report:
- Migration file path.
- What the up migration does.
- What the down migration does.
- Whether rollback was tested successfully.
