{
  programs.thunderbird = {
    enable = true;
    policies = {
      ExtensionSettings = {
        "farahats9@yahoo.com" = {
          installation_mode = "normal_installed";
        };
        "dkim_verifier@pl" = {
          installation_mode = "normal_installed";
        };
      };
    };
    profiles.default = {
      isDefault = true;
      settings = {
        "mailnews.start_page.enabled" = false;
        "mail.receipt.request_return_receipt_on" = true;
        "mail.SpellCheckBeforeSend" = true;
        "network.cookie.cookieBehavior" = 2; # I don't think my email client needs to accept cookies from sites
        "privacy.globalprivacycontrol.enabled" = true;

        # Telemtry config
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;

        # Telemetry backend
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.server" = "";
      };
    };
  };
}
