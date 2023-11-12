build:
	@docker build -t api-devops-challenge:latest .

run:
	@docker run -d -p 8085:8085 --name api-devops-challenge api-devops-challenge:latest

compose:
	#export DOCKER_DEFAULT_PLATFORM=linux/arm64
	@docker compose build
	@docker compose up