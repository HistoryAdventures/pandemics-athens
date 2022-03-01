import 'package:audioplayers/audioplayers.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';

class AudioPlayerUtil {
  static bool isSoundOn = true;

  AudioPlayer audioPlayer = AudioPlayer();

  Future<void> playSound(String assetName ) async {
    if (isSoundOn) {
      if (audioPlayer.state == PlayerState.PAUSED) {
        audioPlayer.release();
      } else {
        final int? result = await audioPlayer.play(assetName);
      }
    } else {
      audioPlayer.state = PlayerState.PAUSED;
    }
  }

  Future<void> playSoundWithLoop(String asset) async {
    if (isSoundOn) {}
  }
}
