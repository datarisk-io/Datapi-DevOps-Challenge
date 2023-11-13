FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

COPY . projeto-fsharp
RUN cd projeto-fsharp && ./restore.sh

RUN cd projeto-fsharp && dotnet fake run build.fsx -t "Build"

FROM mcr.microsoft.com/dotnet/sdk:6.0
LABEL org.opencontainers.image.source="https://github.com/richardneves/Datapi-DevOps-Challenge"
WORKDIR /app

COPY --from=build /app/projeto-fsharp/src/Server/out .

EXPOSE 8085

ENTRYPOINT ["./Server"]