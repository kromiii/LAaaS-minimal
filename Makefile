# Makefile for Learning Analytics Platform

# Variables
MOODLE_COMPOSE_FILE = moodle/docker-compose.yml
LEARNINGLOCKER_COMPOSE_FILE = learninglocker/docker-compose.yml
JUPYTER_COMPOSE_FILE = jupyter/docker-compose.yml

# Start all services
.PHONY: start
start: start-moodle start-learninglocker start-jupyter

# Stop all services
.PHONY: stop
stop: stop-moodle stop-learninglocker stop-jupyter

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

# Start Jupyter Notebook
.PHONY: start-jupyter
start-jupyter:
	docker compose -f $(JUPYTER_COMPOSE_FILE) up -d

# Stop Jupyter Notebook
.PHONY: stop-jupyter
stop-jupyter:
	docker compose -f $(JUPYTER_COMPOSE_FILE) down

# Display status of all services
.PHONY: status
status:
	@echo "Moodle status:"
	@docker compose -f $(MOODLE_COMPOSE_FILE) ps
	@echo "\nLearning Locker status:"
	@docker compose -f $(LEARNINGLOCKER_COMPOSE_FILE) ps
	@echo "\nJupyter status:"
	@docker compose -f $(JUPYTER_COMPOSE_FILE) ps

# Clean up all Docker resources
.PHONY: clean
clean: stop
	docker compose -f $(MOODLE_COMPOSE_FILE) down -v
	docker compose -f $(LEARNINGLOCKER_COMPOSE_FILE) down -v
	docker compose -f $(JUPYTER_COMPOSE_FILE) down -v
