{ pkgs, ... }:
{
  programs.nixcord = {
    enable = true;
    discord = {
      equicord.enable = true;
      openASAR.enable = true;
      krisp.enable = false;
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
        offloadAdmControls = true; # Offload WebRTC processing; Default true
        openH264Enabled = true; # Default true
        enableHardwareAcceleration = true; # give this another go I suppose
        debugLogging = false; # This defaults to true??
      };
    };
    config = {
      useQuickCss = false;
      plugins = {

        # Client optimizations
        crashHandler.enable = true;
        noDevtoolsWarning.enable = true;
        noTypingAnimation.enable = true;
        equicordHelper = {
          enable = true; # Required plugin
          disableAdoptTagPrompt = true;
          noModalAnimation = true;
        };

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
        imageZoom = {
          enable = true;
          size = 1000.0;
        };

        # QOL
        viewIcons.enable = true;
        callTimer.enable = true;
        experiments.enable = true;
        expressionCloner.enable = true;
        fixImagesQuality.enable = true;
        betterForwards = {
          enable = true;
          selfForward = true;
        };
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
        declutter = {
          enable = true;
          alwaysShowUsername = false;
          removeAudioMenus = false;
          removeAvatarDecoration = true;
          removeBillingSettings = false;
          removeClanTag = false;
          removeGiftButton = false;
          removeNameplate = false;
          removeProfileEffect = true; # I genuinely hate profiles being covered by stupid effects
          removeQuestsAboveDms = true;
          removeServerBoostInfo = false;
          removeShopAboveDms = true;
          removeUnavailableEmojiPicker = false;
        };

      };

    };
  };
}
