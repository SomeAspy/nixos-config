{ pkgs, ... }:
{
  programs.librewolf = {
    enable = true;
    package = pkgs.librewolf-bin;
    # uBlock doesn't cloud sync out of the box
    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "normal_installed";
        };
      };
      "3rdparty".Extensions."uBlock0@raymondhill.net" = {
        userSettings = [
          [
            "cloudStorageEnabled"
            "true"
          ]
        ];
      };
    };

    profiles.default = {
      # Sane usability
      settings = {
        # Stuff to give extensions cloud sync
        "services.sync.engine.addons" = true;
        "services.sync.engine.prefs" = true;
        "webextensions.storage.sync.enabled" = true;
        "webextensions.storage.sync.serverURL" = "https://sync.main.fx.services.mozilla.com/v1/";

        "privacy.resistFingerprinting" = false;
        "webgl.disabled" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "network.cookie.lifetimePolicy" = 0;
        "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = false;
        "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = false;
        "privacy.sanitize.sanitizeOnShutdown" = false;
        # "media.eme.enabled" = true;
        # History, Extensions, settings not defined here. Synced history is probably the only reason I keep this, since everything else can be managed by nix.
        "identity.fxaccounts.enabled" = true;
        "signon.rememberSignons" = false; # Bitwarden
        "dom.security.https_only_mode" = true;
        # Yeah yeah google is anti privacy but there is a line I draw between convenience and privacy and DuckDuckGo is shit.
        "browser.search.defaultenginename" = "google";
        "browser.startup.homepage" = "about:home";
        "browser.startup.page" = 1;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
        "browser.newtabpage.activity-stream.showSearch" = true;
        "browser.search.suggest.enabled" = true;
        "browser.urlbar.suggest.searches" = true;
        "services.sync.engine.passwords" = false; # Bitwarden
        "services.sync.engine.creditcards" = false; # Bitwarden
        "browser.tabs.warnOnClose" = false;
      };
      search = {
        force = true;
        default = "notgoogle";
        privateDefault = "ddg";
        engines = {
          "notgoogle" = {
            urls = [
              {
                template = "https://s.dunkirk.sh";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "https://s.dunkirk.sh/goose.gif";
          };
        };
      };
    };
  };
}
