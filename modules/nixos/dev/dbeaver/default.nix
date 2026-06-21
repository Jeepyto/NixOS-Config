{ pkgs, config, ... }:
let
  secretsPath = config.age.secrets.dbeaver-secrets.path;
  dbeaverWrapped = pkgs.writeShellScriptBin "dbeaver" ''
    export DBEAVER_PG_HOST="$(grep '^host:' ${secretsPath} | cut -d' ' -f2)"
    export DBEAVER_PG_PORT="$(grep '^port:' ${secretsPath} | cut -d' ' -f2)"
    export DBEAVER_PG_DATABASE="$(grep '^database:' ${secretsPath} | cut -d' ' -f2)"
    export DBEAVER_PG_USER="$(grep '^username:' ${secretsPath} | cut -d' ' -f2)"
    export DBEAVER_PG_PASSWORD="$(grep '^password:' ${secretsPath} | cut -d' ' -f2)"
    exec ${pkgs.dbeaver-bin}/bin/dbeaver "$@"
  '';
in
{
  environment.systemPackages = [ dbeaverWrapped ];
}
