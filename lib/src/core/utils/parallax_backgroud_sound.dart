import 'package:audioplayers/audioplayers.dart';
import 'package:history_of_adventures/src/core/utils/debouncer.dart';

const String playerId = 'flute';

enum PlayerAction {
  play,
  pause,
  mute,
  unmute,
}
final AudioPlayer _player = AudioPlayer(playerId: playerId);

class BackgroundSound {
  static late Debouncer _debouncer;

  static late String asset;
  static late ReleaseMode mode;

  static PlayerAction? lastAction;
  static String? currentPageName;
  static bool isMuted = false;

  BackgroundSound({
    required String assetName,
    String? pageName,
    ReleaseMode releaseMode = ReleaseMode.LOOP,
  }) {
    mode = releaseMode;
    asset = assetName;
    currentPageName = pageName;

    _debouncer = Debouncer(milliseconds: 100);
  }

  static void doAction(PlayerAction action, {String? pageName}) {
    print(action);
    print(pageName);
    print('currentPageName ----' + (currentPageName ?? '%'));

    lastAction = action;

    switch (action) {
      case PlayerAction.play:
        if (_player.state != PlayerState.PLAYING) {
          _debouncer.run(() async {
            print('playing... ${_player.hashCode}');

            await _player.setReleaseMode(mode);
            await _player.play(asset);
            _player.setVolume(isMuted ? 0 : 0.5);
          });
        }
        break;
      case PlayerAction.pause:
        if (pageName == currentPageName) {
          print('stoping... ${_player.hashCode}');
          _debouncer.run(() async {
            await _player.stop();
          });
        }
        break;
      case PlayerAction.mute:
        isMuted = true;
        _player.setVolume(0);

        print('muted... ${_player.hashCode}');
        break;
      case PlayerAction.unmute:
        isMuted = false;
        _player.setVolume(0.5);

        print('unmuted... ${_player.hashCode}');
        break;
      default:
    }
  }
}
