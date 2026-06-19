{
  programs.plasma = {
    # I'm pretty sure this is literally broken
    # https://github.com/nix-community/plasma-manager/discussions/553
    # https://invent.kde.org/documentation/develop-kde-org/-/work_items/235
    panels = [
      {
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.mediacontroller"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];

      }
    ];
  };
}
