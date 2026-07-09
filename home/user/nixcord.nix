{ pkgs, ... }:
{
  programs.nixcord = {
    enable = true;
    discord = {
      equicord.enable = true;
      openASAR.enable = true;
      package = pkgs.discord.override {
        withTTS = false;
      };
      # Ref: https://github.com/SomeAspy/Discord.json (Very WIP!!!)
      settings = {
        MINIMIZE_TO_TRAY = false;
        SKIP_HOST_UPDATE = true; # Please don't explode
        USE_NEW_UPDATER = false;
        openasar = {
          setup = true;
          quickstart = true;
        };
        offloadAdmControls = true; # Offload WebRTC processing
        openH264Enabled = true; # Discord places this in the file on its own, same for the line above. Better off not fighting it since we wipe the config file.
        enableHardwareAcceleration = false; # Fuck
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
      imageZoom.enable = true;

      # QOL
      viewIcons.enable = true;
      callTimer.enable = true;
      experiments.enable = true;
      expressionCloner.enable = true;
      fixImagesQuality.enable = true;
      betterForwards.enable = true;
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
