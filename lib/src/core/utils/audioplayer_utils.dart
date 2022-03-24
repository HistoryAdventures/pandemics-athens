import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';

class AudioPlayerUtil {
  static bool isSoundOn = true;
  static bool pathogenSecondPage = false;

  static AudioPlayer audioPlayer = AudioPlayer();
  static AudioPlayer audioPlayerLoop = AudioPlayer();
  static AudioPlayer audioPlayerSinglePage = AudioPlayer();
  static AudioPlayer audioPlayerLoopLeanding = AudioPlayer();

  static AudioPlayer bgPlayer1 = AudioPlayer();
  static AudioPlayer bgPlayer2 = AudioPlayer();

  Future<void> playSound(String assetName, {bool? looping}) async {
    if (isSoundOn) {
      if (audioPlayer.state == PlayerState.PAUSED) {
        audioPlayer.resume();
      } else {
        final int? result = await audioPlayer.play(assetName);
      }
    } else {
      audioPlayer.state = PlayerState.PAUSED;
    }
  }

  Future<void> playSoundForSinglePages(String assetName) async {
    if (isSoundOn) {
      if (audioPlayerSinglePage.state == PlayerState.PAUSED) {
        audioPlayerSinglePage.resume();
      } else {
        if (audioPlayerSinglePage.state == PlayerState.PLAYING) {
        } else {
          final int? result = await audioPlayerSinglePage.play(assetName);
          audioPlayerSinglePage.setReleaseMode(ReleaseMode.LOOP);
        }
      }
    } else {
      audioPlayerSinglePage.pause();
      audioPlayerSinglePage.state = PlayerState.PAUSED;
    }
  }

  Future<void> playSoundWithLoop(String asset) async {
    if (isSoundOn) {
      if (audioPlayerLoop.state == PlayerState.PAUSED) {
        audioPlayerLoop.resume();
      } else {
        if (audioPlayerLoop.state == PlayerState.PLAYING) {
          print("Playing");
        } else {
          final int? result = await audioPlayerLoop.play(asset, volume: 0.5);
          audioPlayerLoop.setReleaseMode(ReleaseMode.LOOP);
        }
      }
    } else {
      audioPlayerLoop.pause();
      audioPlayerLoop.state = PlayerState.PAUSED;
    }
  }

  Future<void> playLeandingPageSound(String asset) async {
    if (isSoundOn) {
      if (audioPlayerLoopLeanding.state == PlayerState.PAUSED) {
        audioPlayerLoopLeanding.resume();
      } else {
        if (audioPlayerLoopLeanding.state == PlayerState.PLAYING) {
        } else {
          final int? result =
              await audioPlayerLoopLeanding.play(asset, volume: 0.5);
          audioPlayerLoopLeanding.setReleaseMode(ReleaseMode.LOOP);
        }
      }
    } else {
      audioPlayerLoopLeanding.pause();
      audioPlayerLoopLeanding.state = PlayerState.PAUSED;
    }
  }

  Future<void> playSoundForNikosChoose(routeName) async {
    if (isSoundOn) {
      if (bgPlayer1.state == PlayerState.PAUSED &&
          bgPlayer2.state == PlayerState.PAUSED) {
        print("PAUSED");
        bgPlayer1.resume();
        bgPlayer2.resume();
      } else {
        int result = await bgPlayer1.play(routeName == "KeepGoing"
            ? AssetsPath.keepGoingSound
            : AssetsPath.quitMedicinePageSound);
        int result1 =
            await bgPlayer2.play(AssetsPath.nikosChooseBG, volume: 0.2);

        print("PLAYING");
      }
    } else {
      bgPlayer1.pause();
      bgPlayer2.pause();
    }
  }

  String getCurrentRouteName(String? routeSetting) {
    return routeSetting!.split('Page')[0];
  }

  Future<void> soundPlayingControll(
      {bool? isSoundOn, String? routeName}) async {
    if (routeName == "Leanding") {
      playLeandingPageSound(AssetsPath.leandingBgSound);
      audioPlayerLoopLeanding.state =
          isSoundOn! ? PlayerState.PLAYING : PlayerState.PAUSED;
    } else if (routeName == "Glossary") {
      playLeandingPageSound(AssetsPath.leandingBgSound);
      audioPlayerLoopLeanding.state =
          isSoundOn! ? PlayerState.PLAYING : PlayerState.PAUSED;
    } else if (routeName == "Map" ||
        routeName == "Characrter" ||
        routeName == "Document" ||
        routeName == "DeadOfSocrates" ||
        routeName == "VirusLocation" ||
        (routeName == "PathogenProfile" && !pathogenSecondPage) ||
        routeName == "VirusLocationSecond" ||
        routeName == "BodyInfo" ||
        routeName == "VirusesInfo") {
      playSoundWithLoop(AssetsPath.storyBackgroundSound);
      audioPlayerLoop.state =
          isSoundOn! ? PlayerState.PLAYING : PlayerState.PAUSED;
    } else if (routeName == "KeepGoing" || routeName == "QuitMedicine") {
      print("QuitMedicine");
      playSoundForNikosChoose(routeName);
      bgPlayer1.state = isSoundOn! ? PlayerState.PLAYING : PlayerState.PAUSED;
      bgPlayer2.state = isSoundOn ? PlayerState.PLAYING : PlayerState.PAUSED;
    } else if (routeName == "PathogenProfile") {
      AudioPlayerUtil().playSoundForSinglePages(
        AssetsPath.nikoCries,
      );
      audioPlayerSinglePage.state =
          isSoundOn! ? PlayerState.PLAYING : PlayerState.PAUSED;
    } else if (routeName == "IrlNikos") {
      playSoundForSinglePages(AssetsPath.nikosChooseBG);
      audioPlayerSinglePage.state =
          isSoundOn! ? PlayerState.PLAYING : PlayerState.PAUSED;
    }
  }
}
