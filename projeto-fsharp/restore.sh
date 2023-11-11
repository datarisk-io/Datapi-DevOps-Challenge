#!/bin/sh

dotnet tool restore
dotnet paket install
dotnet paket restore
