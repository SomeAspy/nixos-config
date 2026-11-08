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
        # 2 = Reject all - Explodes Google SSO
        # 1 = Reject 3rd party - Explodes MS Exchange
        # 0 = accept all
        "network.cookie.cookieBehavior" = 0;
        "privacy.globalprivacycontrol.enabled" = true;

        # Telemetry config
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
