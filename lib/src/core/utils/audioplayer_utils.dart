import 'package:audioplayers/audioplayers.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';

class AudioPlayerUtil {
  static bool isSoundOn = true;

  AudioPlayer audioPlayer = AudioPlayer();
  static AudioPlayer audioPlayerLoop = AudioPlayer();
  static AudioPlayer audioPlayerLoopLeanding = AudioPlayer();

  Future<void> playSound(String assetName) async {
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
}
