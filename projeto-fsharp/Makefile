build:
	@docker build -t vitorcostasilva/api-devops-challenge:1.0 .

run:
	@docker run -d -p 8085:8085 --name api-devops-challenge vitorcostasilva/api-devops-challenge:1.0

compose:
	#export DOCKER_DEFAULT_PLATFORM=linux/arm64
	@docker compose build
	@docker compose up