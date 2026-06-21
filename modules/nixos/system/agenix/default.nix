{ ... }:
{
  age.secrets.dbeaver-secrets = {
    file = ../../../../dbeaver-secrets.age;
    owner = "jeepyto";
    mode = "0400";
  };

  age.identityPaths = [ "/home/jeepyto/.ssh/agenix_key" ];
}
