FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app
# Copy csproj and restore as distinct layers
COPY . ./
RUN dotnet restore ./CoronaTrackerBackend.Server/CoronaTrackerBackend.Server.csproj
# Copy everything else and build
COPY . ./
RUN dotnet publish ./CoronaTrackerBackend.Server/CoronaTrackerBackend.Server.csproj -c Release -o out
# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/CoronaTrackerBackend.Server/out/ .
ENTRYPOINT ["dotnet", "CoronaTrackerBackend.Server.dll"]