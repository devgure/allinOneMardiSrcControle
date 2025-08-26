# Makefile
up:
	docker-compose up --build

down:
	docker-compose down

logs:
	docker-compose logs -f

test:
	cd services/auth-service && npm test

build:
	docker-compose build

deploy-prod:
	# Example: kubectl apply -f kubernetes/
	@echo "Deploy to production (K8s)"

.PHONY: up down logs test build deploy-prod