FROM mcr.microsoft.com/dotnet/sdk:6.0.413 as Build

WORKDIR /app

COPY . .

RUN dotnet tool restore

RUN dotnet paket install

RUN dotnet paket restore

RUN dotnet fake run build.fsx -t "Build"

FROM mcr.microsoft.com/dotnet/sdk:6.0.413 as Run

COPY --from=build /app/src/Server/out .

EXPOSE 8085

ENTRYPOINT ["./Server"]