self: super:
let
  pname = "dotnet-sdk";
  platform = if super.pkgs.stdenv.isLinux then "linux" else "osx";
  suffix = "x64";
  shaLinux = "sha512-7gp31U5tSRe+cxD/Crs7rVUlv7S+sdsMIV5l9k60ZRH18S1sf/RlodSrOFd+ahlQ/eR57pSDnFDmJwIDKKcC3g==";
  shaOsx = "YFsoE128jDTyV+odENAu2xZWmVflVOzEnCqfu0IAlgsv4hoG8rdwqZB/qRXr7w5iYHBMyeBaga+THxDc5/RhZQ==";
in
{
  dotnet-sdk_6 = super.dotnetCorePackages.sdk_6_0.overrideAttrs (attrs: rec {
    version = "6.0.413";
    src = super.fetchurl {
      url = "https://dotnetcli.azureedge.net/dotnet/Sdk/${version}/${pname}-${version}-${platform}-${suffix}.tar.gz";
      sha512 = if super.pkgs.stdenv.isLinux then shaLinux else shaOsx;
    };
  });
}
