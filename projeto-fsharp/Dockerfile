FROM mcr.microsoft.com/dotnet/sdk:6.0.413 AS builder
#Criando um diretório específico dentro do container para melhor organização
WORKDIR /api
COPY . .
#Restaurando os pacotes necessários para executar o projeto e Buildando.
RUN ./restore.sh && \
    dotnet fake run build.fsx -t "Build" 

#Iniciando Server. (Multi-stage)
FROM mcr.microsoft.com/dotnet/aspnet:6.0.0 AS runtime
WORKDIR /api
EXPOSE 8085
COPY --from=builder /api/src/Server/out /api
#Comando para iniciar o servidor
CMD ./Server