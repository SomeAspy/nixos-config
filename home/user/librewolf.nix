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
        "network.cookie.lifetimePolicy" = 0; # might fuck shit up idk. third party cookies are probably the more important thing
        "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = false;
        "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = false;
        "privacy.sanitize.sanitizeOnShutdown" = false;
        # "media.eme.enabled" = true;
        # History, Extensions, settings not defined here. Synced history is probably the only reason I keep this, since everything else can be managed by nix.
        # Extensions can eventually be migrated into the config here
        # In theory I could store my history elsewhere but maybe A project for another time?
        # It would also break cloud sync (see start of this settings object) which I only use for ublock to sync my current filter whitelists
        # Not realistic to hardcode them into nix config because they can change so often
        "identity.fxaccounts.enabled" = true;
        "signon.rememberSignons" = false; # Bitwarden
        "dom.security.https_only_mode" = true;
        # Yeah yeah google is anti privacy but there is a line I draw between convenience and privacy and DuckDuckGo is shit.
        "browser.search.defaultenginename" = "dunkirkDuckbangs";
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
        default = "dunkirkDuckbangs";
        privateDefault = "ddg";
        engines = {
          "dunkirkDuckbangs" = {
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
