# Build layer

# Official .NET SDK image as a base image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Build directory
WORKDIR /build

# Copy the F# API app source code to the container
COPY projeto-fsharp .

# Run the restore script
RUN ./restore.sh

# Run the build command to build the app
RUN dotnet fake run build.fsx -t "Build"

# Run layer

# Official .NET runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime

# Working app directory
WORKDIR /app

# Copy the built app from the build layer
COPY --from=build /build/src/Server/out /app

# Expose the port that the app will run on
EXPOSE 8085

# Command to run the app when the container starts
CMD ["dotnet", "Server.dll"]
