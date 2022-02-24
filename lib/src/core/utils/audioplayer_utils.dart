import 'package:audioplayers/audioplayers.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';

class AudioPlayerUtil {
  // Leanding page
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer leandingBgSound = AudioPlayer();

  AudioPlayer menuOntapSound = AudioPlayer();
  AudioPlayer menuClose = AudioPlayer();
  AudioPlayer glossaryOpen = AudioPlayer();
  AudioPlayer glossaryHover = AudioPlayer();
  AudioPlayer glossaryOnTap = AudioPlayer();
  AudioPlayer glossaryClosePage = AudioPlayer();

  Future<void> playSound() async {
    // final int? result = await leandingBgSound.play(AssetsPath.leandingBgSound);
    // if (result == 1) {
    //   audioPlayerState = PlayerState.PLAYING;
    // }
    // leandingBgSound.setReleaseMode(ReleaseMode.LOOP);
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
}
