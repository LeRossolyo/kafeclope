BACKEND_NAME=$(shell docker compose ps -q backend)
POSTGRES_NAME=$(shell docker compose ps -q db)

DOCKER_RUN_OPTIONS=-it
## Only allocate tty if we detect one
ifdef NOT_TTY
DOCKER_RUN_OPTIONS=-t
endif

init:
	@make -s build
	@make -s serve

serve:
	@docker-compose up --remove-orphans

build:
	@docker-compose build

build-no-cache:
	@docker-compose build --no-cache

workspace:
	@docker exec -it ${BACKEND_NAME} /bin/sh

deps:
	@docker exec -it ${BACKEND_NAME} /bin/sh -c "pnpm install"

migrate:
	@docker exec -t ${BACKEND_NAME} /bin/sh -c "npm run migration:up"

migrate-revert:
	@docker exec -t ${BACKEND_NAME} /bin/sh -c "npm run migration:down"

reset-db:
	@echo "TODO"

postgres:
	@docker exec -it ${POSTGRES_NAME} psql -U postgres

stop-backend:
	@docker stop ${BACKEND_NAME}

restart-backend:
	@docker restart ${BACKEND_NAME}

stop-postgres:
	@docker stop ${POSTGRES_NAME}

restart-postgres:
	@docker restart ${POSTGRES_NAME}
