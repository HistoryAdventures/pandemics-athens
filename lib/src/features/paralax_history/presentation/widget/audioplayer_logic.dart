import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';

class ParallaxAudioLogic {
  AudioPlayer audioPlayerforParallaxVideo = AudioPlayer();
  AudioPlayer audioPlayerforWind = AudioPlayer();
  AudioPlayer nikosPart = AudioPlayer();
  AudioPlayer backgroundSound = AudioPlayer();
  AudioPlayer audioPlayerforPeople1 = AudioPlayer();
  AudioPlayer audioPlayerforPeople2 = AudioPlayer();
  AudioPlayer footsteps = AudioPlayer();
  AudioPlayer cough = AudioPlayer();
  AudioPlayer water = AudioPlayer();

  final GlobalKey _athensButtonKey = GlobalKey();
  final GlobalKey _nikosGifKey = GlobalKey();
  final GlobalKey _nikosText2Key = GlobalKey();
  final GlobalKey _nikosText3Key = GlobalKey();
  final GlobalKey _nikosText4Key = GlobalKey();
  final GlobalKey _nikosText5Key = GlobalKey();
  final GlobalKey _chooseKey = GlobalKey();

  bool played = false;
  bool played0 = false;
  bool played1 = false;
  bool played2 = false;
  bool played3 = false;
  bool played4 = false;
  bool played5 = false;
  bool played6 = false;
  bool played7 = false;

  double getObjectPositionByKey(globalKey) {
    RenderBox box = globalKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    double y = position.dy;
    return y;
  }

  double getHeight(globalKey) {
    RenderBox box = globalKey.currentContext!.findRenderObject() as RenderBox;
    Size size = box.size;
    return size.height;
  }

  Future<void> scrollable(BuildContext context,
      {required Curve curve, ScrollPositionAlignmentPolicy? alignmentPolicy}) {
    return Scrollable.ensureVisible(context,
        alignmentPolicy: alignmentPolicy!, curve: curve);
  }

  void audioPlayerLogic(direction) {
    if (direction == ScrollDirection.reverse) {
      if (getObjectPositionByKey(_nikosGifKey) - getHeight(_nikosGifKey) * 5 <
          20) {
        if (!played1) {
          played1 = true;
          audioPlayerforWind.setVolume(0.8);
          audioPlayerforWind.setVolume(0.7);
          audioPlayerforWind.setVolume(0.6);
          audioPlayerforWind.setVolume(0.4);
          cough.setVolume(0.0);

          Future.delayed(Duration(seconds: 2)).then((value) {
            // nikosPart.seek(Duration(milliseconds: 0));
            // nikosPart.setVolume(1.0);
            nikosPart.seek(Duration(milliseconds: 0));
          });
          Future.delayed(Duration(seconds: 2)).then((value) {
            audioPlayerforWind.setVolume(0.2);
            audioPlayerforWind.setVolume(0.0);
            audioPlayerforWind.stop();
          });
        }
      }

      if (getObjectPositionByKey(_nikosText2Key) -
              getHeight(_nikosText2Key) * 2 <
          20) {
        if (!played2) {
          played2 = true;
          // nikosPart.stop();
          nikosPart.setVolume(0.8);
          nikosPart.setVolume(0.6);
          nikosPart.setVolume(0.4);
          cough.setVolume(0.0);
          Future.delayed(Duration(seconds: 2)).then((value) {
            audioPlayerforPeople1.seek(Duration(milliseconds: 0));
            audioPlayerforPeople1.resume();
          });

          Future.delayed(Duration(seconds: 2)).then((value) {
            nikosPart.setVolume(0.2);
            nikosPart.setVolume(0.0);
            nikosPart.stop();
          });
        }
      }

      if (getObjectPositionByKey(_nikosText3Key) -
              getHeight(_nikosText3Key) * 2 <
          20) {
        if (!played3) {
          played3 = true;
          // audioPlayerforPeople1.dispose();
          nikosPart.setVolume(0.0);
          audioPlayerforPeople1.setVolume(0.8);
          audioPlayerforPeople1.setVolume(0.6);
          audioPlayerforPeople1.setVolume(0.4);

          // audioPlayerforPeople1.setVolume(0.0);
          cough.setVolume(0.0);

          Future.delayed(Duration(seconds: 2)).then((value) {
            audioPlayerforPeople2.seek(Duration(milliseconds: 0));
            audioPlayerforPeople2.setVolume(1.0);
          });
          Future.delayed(Duration(seconds: 2)).then((value) {
            audioPlayerforPeople1.setVolume(0.2);
            audioPlayerforPeople1.setVolume(0.0);
            audioPlayerforPeople1.stop();
          });

          // playPeople2Sound();
        }
      }

      if (getObjectPositionByKey(_nikosText4Key) -
              getHeight(_nikosText4Key) * 1.5 <
          20) {
        if (!played4) {
          played4 = true;
          cough.setVolume(0.0);
          audioPlayerforPeople2.setVolume(0.8);
          audioPlayerforPeople2.setVolume(0.6);
          audioPlayerforPeople2.setVolume(0.4);

          Future.delayed(Duration(seconds: 2)).then((value) {
            footsteps.seek(Duration(milliseconds: 0));
            footsteps.setVolume(1.0);
          });
          // backgroundSound.seek(Duration(milliseconds: 0));
          Future.delayed(Duration(seconds: 2)).then((value) {
            audioPlayerforPeople2.setVolume(0.2);
            audioPlayerforPeople2.setVolume(0.0);
            audioPlayerforPeople2.stop();
          });

          // audioPlayerforPeople2.dispose();

          // backgroundSound.seek(Duration(seconds: 0));
          // footSteps();
        }
      }

      if (getObjectPositionByKey(_nikosText5Key) -
              getHeight(_nikosText5Key) * 4.5 <
          10) {
        if (!played5) {
          played5 = true;
          footsteps.setVolume(0.8);
          footsteps.setVolume(0.6);
          footsteps.setVolume(0.4);

          Future.delayed(Duration(seconds: 1)).then((value) {
            cough.seek(Duration(milliseconds: 0));
            cough.setVolume(1.0);
          });
          // backgroundSound.seek(Duration(milliseconds: 0));
          Future.delayed(Duration(seconds: 1)).then((value) {
            footsteps.setVolume(0.2);
            footsteps.setVolume(0.0);
            footsteps.stop();
          });

          // footsteps.dispose();
          // coughSound();
        }
      }

      if (getObjectPositionByKey(_nikosText5Key) < 0) {
        if (!played6) {
          played6 = true;

          cough.setVolume(0.8);
          cough.setVolume(0.6);
          cough.setVolume(0.4);

          Future.delayed(Duration(seconds: 1)).then((value) {
            water.seek(Duration(milliseconds: 0));
            water.setVolume(1.0);
          });
          // backgroundSound.seek(Duration(milliseconds: 0));
          Future.delayed(Duration(seconds: 1)).then((value) {
            cough.setVolume(0.2);
            cough.setVolume(0.0);
            cough.stop();
          });
        }
        // }
      }
    }
    // else {
    //   if (played0 == true) {
    //     played0 = !played0;
    //   }
    // }
    if (direction == ScrollDirection.forward) {
      if (getObjectPositionByKey(_nikosGifKey) - getHeight(_nikosGifKey) * 5 >
              20 &&
          getObjectPositionByKey(_nikosGifKey) - getHeight(_nikosGifKey) * 5 <
              200) {
        played0 = false;
        played1 = false;
        played2 = false;
        played3 = false;
        played4 = false;
        played5 = false;
        played6 = false;
        played7 = false;

        if (audioPlayerforPeople1.state == PlayerState.PLAYING) {
          audioPlayerforPeople1.stop();
        }
        if (audioPlayerforPeople2.state == PlayerState.PLAYING) {
          audioPlayerforPeople2.stop();
        }
        if (water.state == PlayerState.PLAYING) {
          water.stop();
        }
        if (footsteps.state == PlayerState.PLAYING) {
          footsteps.stop();
        }
        if (cough.state == PlayerState.PLAYING) {
          cough.stop();
        }

        // audioPlayerforPeople1;
        // audioPlayerforPeople2.dispose();
        // water.dispose();
        // footsteps.dispose();
        // cough.dispose();
        if (nikosPart.state == PlayerState.STOPPED) {
          nikosPart.resume();
        }

        nikosPart.setVolume(0.8);
        nikosPart.setVolume(0.6);
        nikosPart.setVolume(0.4);

        Future.delayed(Duration(seconds: 1)).then((value) {
          if (audioPlayerforWind.state == PlayerState.STOPPED) {
            audioPlayerforWind.resume();
          }
          audioPlayerforWind.seek(Duration(milliseconds: 0));
          audioPlayerforWind.setVolume(1.0);
        });
        Future.delayed(Duration(seconds: 1)).then((value) {
          nikosPart.setVolume(0.2);
          nikosPart.setVolume(0.0);
        });
      }

      if (getObjectPositionByKey(_nikosText2Key) -
                  getHeight(_nikosText2Key) * 2 >
              50 &&
          getObjectPositionByKey(_nikosText2Key) -
                  getHeight(_nikosText2Key) * 2 <
              150) {
        //nikosPart.dispose();
        //   backgroundSound.dispose();
        played0 = false;
        played1 = false;
        played2 = false;
        played3 = false;
        played4 = false;
        played5 = false;
        played6 = false;
        played7 = false;

        if (audioPlayerforPeople2.state == PlayerState.PLAYING) {
          audioPlayerforPeople2.stop();
        }
        if (water.state == PlayerState.PLAYING) {
          water.stop();
        }
        if (footsteps.state == PlayerState.PLAYING) {
          footsteps.stop();
        }
        if (cough.state == PlayerState.PLAYING) {
          cough.stop();
        }
        if (audioPlayerforPeople1.state == PlayerState.STOPPED) {
          audioPlayerforPeople1.resume();
        }

        audioPlayerforPeople1.setVolume(0.8);
        audioPlayerforPeople1.setVolume(0.6);
        audioPlayerforPeople1.setVolume(0.4);

        Future.delayed(Duration(seconds: 1)).then((value) {
          if (nikosPart.state == PlayerState.STOPPED) {
            nikosPart.resume();
          }
          nikosPart.seek(Duration(milliseconds: 0));
          nikosPart.setVolume(1.0);
        });
        Future.delayed(Duration(seconds: 1)).then((value) {
          audioPlayerforPeople1.setVolume(0.2);
          audioPlayerforPeople1.setVolume(0.0);
        });
      }

      if (getObjectPositionByKey(_nikosText3Key) -
                  getHeight(_nikosText3Key) * 2 >
              10 &&
          getObjectPositionByKey(_nikosText3Key) -
                  getHeight(_nikosText3Key) * 2 <
              50) {
        //nikosPart.dispose();
        //   backgroundSound.dispose();
        played0 = false;
        played1 = false;
        played2 = false;
        played3 = false;
        played4 = false;
        played5 = false;
        played6 = false;
        played7 = false;

        if (water.state == PlayerState.PLAYING) {
          water.stop();
        }
        if (footsteps.state == PlayerState.PLAYING) {
          footsteps.stop();
        }
        if (cough.state == PlayerState.PLAYING) {
          cough.stop();
        }

        if (audioPlayerforPeople2.state == PlayerState.STOPPED) {
          audioPlayerforPeople2.resume();
        }

        audioPlayerforPeople2.setVolume(0.8);
        audioPlayerforPeople2.setVolume(0.6);
        audioPlayerforPeople2.setVolume(0.4);

        Future.delayed(Duration(seconds: 1)).then((value) {
          if (audioPlayerforPeople1.state == PlayerState.STOPPED) {
            audioPlayerforPeople1.resume();
          }

          audioPlayerforPeople1.seek(Duration(milliseconds: 0));
          audioPlayerforPeople1.setVolume(1.0);
        });
        Future.delayed(Duration(seconds: 1)).then((value) {
          audioPlayerforPeople2.setVolume(0.2);
          audioPlayerforPeople2.setVolume(0.0);
        });

        // played0 = false;
        // played1 = false;
        // played2 = false;
        // played3 = false;
        // played4 = false;
      }

      if (getObjectPositionByKey(_nikosText4Key) -
                  getHeight(_nikosText4Key) * 1.5 >
              10 &&
          getObjectPositionByKey(_nikosText4Key) -
                  getHeight(_nikosText4Key) * 1.5 <
              90) {
        played0 = false;
        played1 = false;
        played2 = false;
        played3 = false;
        played4 = false;
        played5 = false;
        played6 = false;
        played7 = false;
        if (audioPlayerforPeople1.state == PlayerState.PLAYING) {
          audioPlayerforPeople1.stop();
        }

        if (water.state == PlayerState.PLAYING) {
          water.stop();
        }

        if (cough.state == PlayerState.PLAYING) {
          cough.stop();
        }

        footsteps.setVolume(0.8);
        footsteps.setVolume(0.6);
        footsteps.setVolume(0.4);

        Future.delayed(Duration(seconds: 1)).then((value) {
          if (audioPlayerforPeople2.state == PlayerState.STOPPED) {
            audioPlayerforPeople2.resume();
          }
          audioPlayerforPeople2.seek(Duration(milliseconds: 0));
          audioPlayerforPeople2.setVolume(1.0);
        });
        Future.delayed(Duration(seconds: 1)).then((value) {
          if (footsteps.state == PlayerState.STOPPED) {
            footsteps.resume();
          }
          footsteps.setVolume(0.2);
          footsteps.setVolume(0.0);
        });
      }

      if (getObjectPositionByKey(_nikosText5Key) -
                  getHeight(_nikosText5Key) * 7 >
              10 &&
          getObjectPositionByKey(_nikosText5Key) -
                  getHeight(_nikosText5Key) * 7 <
              90) {
        played0 = false;
        played1 = false;
        played2 = false;
        played3 = false;
        played4 = false;
        played5 = false;
        played6 = false;
        played7 = false;
        cough.setVolume(0.8);
        cough.setVolume(0.6);
        cough.setVolume(0.4);

        Future.delayed(Duration(seconds: 1)).then((value) {
          footsteps.seek(Duration(milliseconds: 0));
          footsteps.setVolume(1.0);
        });
        Future.delayed(Duration(seconds: 1)).then((value) {
          cough.setVolume(0.2);
          cough.setVolume(0.0);
        });
      }

      if (getObjectPositionByKey(_nikosText5Key) > 10 &&
          getObjectPositionByKey(_nikosText5Key) < 100) {
        played0 = false;
        played1 = false;
        played2 = false;
        played3 = false;
        played4 = false;
        played5 = false;
        played6 = false;
        played7 = false;
        water.setVolume(0.8);
        water.setVolume(0.6);
        water.setVolume(0.4);

        Future.delayed(Duration(seconds: 1)).then((value) {
          cough.seek(Duration(milliseconds: 0));
          cough.setVolume(1.0);
        });
        Future.delayed(Duration(seconds: 1)).then((value) {
          water.setVolume(0.2);
          water.setVolume(0.0);
        });
      }
    }
  }

  Future plaWindSound() async {
    final int? result = await audioPlayerforWind.play(AssetsPath.windSound);
    await audioPlayerforWind.setReleaseMode(ReleaseMode.LOOP);
  }

  Future playNikosPartSound() async {
    final int? result = await nikosPart.play(AssetsPath.nikosPartSound);
    await nikosPart.setReleaseMode(ReleaseMode.LOOP);
    nikosPart.stop();
  }

  Future playPeople1Sound() async {
    final int? result = await audioPlayerforPeople1.play(
      AssetsPath.peopleSound1,
    );
    audioPlayerforPeople1.stop();
    await audioPlayerforPeople1.setReleaseMode(ReleaseMode.LOOP);
  }

  Future playPeople2Sound() async {
    final int? result =
        await audioPlayerforPeople2.play(AssetsPath.peopleSound2, volume: 0.0);
    await audioPlayerforPeople2.setReleaseMode(ReleaseMode.LOOP);
  }

  Future footSteps() async {
    final int? result = await footsteps.play(AssetsPath.footsteps, volume: 0.0);
    await footsteps.setReleaseMode(ReleaseMode.LOOP);
  }

  Future coughSound() async {
    final int? result = await cough.play(AssetsPath.cough, volume: 0.0);
    await cough.setReleaseMode(ReleaseMode.LOOP);
  }

  Future waterSound() async {
    final int? result = await water.play(AssetsPath.water, volume: 0.0);
    await water.setReleaseMode(ReleaseMode.LOOP);
  }

  Future bGSound() async {
    final int? bgResult =
        await backgroundSound.play(AssetsPath.parallaxBgSound, volume: 0.5);
    await backgroundSound.setReleaseMode(ReleaseMode.LOOP);
  }
}
