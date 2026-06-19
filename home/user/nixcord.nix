{ pkgs, ... }:
{
  programs.nixcord = {
    enable = true;
    discord = {
      equicord.enable = true;
      vencord.enable = false; # I am getting a warning that this cannot be enabled despite not being explicitly enabled. https://github.com/FlameFlag/nixcord/issues/227
      openASAR.enable = true;
      package = pkgs.discord.override {
        withTTS = false;
      };
      settings = {
        SKIP_HOST_UPDATE = true; # Please don't explode
        USE_NEW_UPDATER = false;
      };
    };
    config.plugins = {

      # Client optimizations
      crashHandler.enable = true;
      noDevtoolsWarning.enable = true;
      noTypingAnimation.enable = true;

      # Necessities
      blurNsfw.enable = true;
      disableCallIdle.enable = true;
      messageLogger.enable = true;
      platformIndicators.enable = true;
      roleColorEverywhere.enable = true;
      stickerPaste.enable = true;
      typingTweaks.enable = true;
      validUser.enable = true;
      validReply.enable = true;
      volumeBooster.enable = true;

      # QOL
      callTimer.enable = true;
      experiments.enable = true;
      expressionCloner.enable = true;
      fixImagesQuality.enable = true;
      forwardAnywhere.enable = true;
      gifPaste.enable = true;
      guildPickerDumper.enable = true;
      mentionAvatars.enable = true;
      noF1.enable = true;
      noUnblockToJump.enable = true; # I don't block people, only annoying bots so I guess this helps
      reverseImageSearch.enable = true;
      reviewDb.enable = true;
      serverInfo.enable = true;
      showHiddenThings.enable = true;
      translate.enable = true;

    };

  };
}
