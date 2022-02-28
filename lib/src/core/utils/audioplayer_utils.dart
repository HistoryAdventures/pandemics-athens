import 'package:audioplayers/audioplayers.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';

class AudioPlayerUtil {
  static bool isSoundOn = false;

  // Leanding page
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer backgroundSound = AudioPlayer();

  AudioPlayer menuOntapSound = AudioPlayer();
  AudioPlayer menuClose = AudioPlayer();
  AudioPlayer glossaryOpen = AudioPlayer();
  AudioPlayer glossaryHover = AudioPlayer();
  AudioPlayer glossaryOnTap = AudioPlayer();
  AudioPlayer glossaryClosePage = AudioPlayer();

  AudioPlayer viruses = AudioPlayer();
  AudioPlayer screenTransition = AudioPlayer();

  AudioPlayer mapSound = AudioPlayer();
  AudioPlayer quizSound = AudioPlayer();

  Future<void> playScreenTransition() async {
    final int? result =
        await screenTransition.play(AssetsPath.screenTransitionSound);
  }

  // Future<void> displayScreejnTransitionSound() async {
  //   await screenTransition.dispose();
  // }

  Future<void> playSound(String assetName) async {
    final int? result = await backgroundSound.play(assetName);
    await backgroundSound.setReleaseMode(ReleaseMode.LOOP);
  }

  Future<void> stopPlaySound() async {
    await backgroundSound.dispose();
  }

  Future<void> playMenuOntapSound() async {
    final int? result = await menuOntapSound.play(AssetsPath.menuOntapSound);
  }

  Future<void> playMenuCloseSound() async {
    final int? result = await menuClose.play(AssetsPath.menuCloseSound);
  }

  Future<void> playGlossaryPageSound() async {
    final int? result =
        await glossaryOpen.play(AssetsPath.glossaryBackgoundPage);
  }

  Future<void> playGlossaryItemHoverSound() async {
    final int? result = await glossaryHover.play(AssetsPath.glossaryItemHover);
  }

  Future<void> playGlossaryItemOnTapSound() async {
    final int? result = await glossaryOnTap.play(AssetsPath.glossaryItemOnTap);
  }

  Future<void> playGlossaryPageCloseSound() async {
    final int? result =
        await glossaryClosePage.play(AssetsPath.glossaryPageClose);
  }

  Future<void> playVirusSound(String assetName) async {
    final int? result = await viruses.play(assetName);
  }

  Future<void> playZoomInSound() async {
    final int? result = await mapSound.play(AssetsPath.infoOpen);
  }

  Future<void> playZoomCloseSound() async {
    final int? result = await mapSound.play(AssetsPath.infoClose);
  }

  Future<void> playChangeIndexSound() async {
    final int? result = await mapSound.play(AssetsPath.changeIndex);
  }

  Future<void> playQuizSound(String assetName) async {
    final int? result = await mapSound.play(assetName);
  }

  Future<void> disposeMapSounds() async {
    await mapSound.dispose();
  }

  Future<void> mute() async {
    menuOntapSound.pause();
    menuClose.pause();
    glossaryOpen.pause();
    glossaryHover.pause();
    glossaryOnTap.pause();
    glossaryClosePage.pause();
  }

  Future<void> unMute() async {
    menuOntapSound.resume();
    menuClose.resume();
    glossaryOpen.resume();
    glossaryHover.resume();
    glossaryOnTap.resume();
    glossaryClosePage.resume();
  }
}
