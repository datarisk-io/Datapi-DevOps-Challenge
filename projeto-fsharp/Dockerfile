FROM mcr.microsoft.com/dotnet/sdk:6.0.413 AS builder
#Criando um diretório específico dentro do container para melhor organização
WORKDIR /api
COPY . .
#Restaurando os pacotes necessários para executar o projeto e Buildando.
RUN echo 'source https://www.nuget.org/api/v2' > paket.dependencies \
    && echo 'nuget FAKE' >> paket.dependencies \
    && echo 'nuget FSharp.Core <version>' >> paket.dependencies \
    && ./restore.sh && \
    && dotnet fake run build.fsx -t "Build" 

#Iniciando Server. (Multistaging)
FROM mcr.microsoft.com/dotnet/aspnet:6.0.0 AS runtime
WORKDIR /api
EXPOSE 8085
COPY --from=builder /api/src/Server/out /api
#Comando para iniciar o servidor
CMD ./Server