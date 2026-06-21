{ ... }:
{
  security.polkit.extraConfig = ''
    polkit.addRule(function (action, subject) {
      if (
        action.id == "org.freedesktop.systemd1.manage-units" &&
        action.lookup("unit") == "ananicy-cpp.service" &&
        subject.user == "jeepyto"
      ) {
        return polkit.Result.YES;
      }
    });
  '';
}
