let
  jeepyto = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPFj6zHrhE8Yv9DUhco3m+yLEjcHUbUDyvcA1Wf7OPsf agenix-dbeaver";
in
{
  "dbeaver-secrets.age".publicKeys = [ jeepyto ];
}
