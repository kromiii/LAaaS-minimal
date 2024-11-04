# Makefile for Learning Analytics Platform

# Variables
MOODLE_COMPOSE_FILE = moodle/docker-compose.yml
LEARNINGLOCKER_COMPOSE_FILE = learninglocker/docker-compose.yml
SUPERSET_COMPOSE_FILE = superset/docker-compose.yml

# Start all services
.PHONY: start
start: start-moodle start-learninglocker start-superset

# Stop all services
.PHONY: stop
stop: stop-moodle stop-learninglocker stop-superset

# Start Moodle
.PHONY: start-moodle
start-moodle:
	docker compose -f $(MOODLE_COMPOSE_FILE) up -d

# Stop Moodle
.PHONY: stop-moodle
stop-moodle:
	docker compose -f $(MOODLE_COMPOSE_FILE) down

# Start Learning Locker
.PHONY: start-learninglocker
start-learninglocker:
	docker compose -f $(LEARNINGLOCKER_COMPOSE_FILE) up -d

# Stop Learning Locker
.PHONY: stop-learninglocker
stop-learninglocker:
	docker compose -f $(LEARNINGLOCKER_COMPOSE_FILE) down

# Start Superset
.PHONY: start-superset
start-superset:
	docker compose -f $(SUPERSET_COMPOSE_FILE) up -d

# Stop Superset
.PHONY: stop-superset
stop-superset:
	docker compose -f $(SUPERSET_COMPOSE_FILE) down

# Display status of all services
.PHONY: status
status:
	@echo "Moodle status:"
	@docker compose -f $(MOODLE_COMPOSE_FILE) ps
	@echo "\nLearning Locker status:"
	@docker compose -f $(LEARNINGLOCKER_COMPOSE_FILE) ps
	@echo "\nSuperset status:"
	@docker compose -f $(SUPERSET_COMPOSE_FILE) ps

# Clean up all Docker resources
.PHONY: clean
clean: stop
	docker compose -f $(MOODLE_COMPOSE_FILE) down -v
	docker compose -f $(LEARNINGLOCKER_COMPOSE_FILE) down -v
	docker compose -f $(SUPERSET_COMPOSE_FILE) down -v
