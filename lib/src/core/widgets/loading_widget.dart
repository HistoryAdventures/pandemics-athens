import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/animated_loading.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import '../colors.dart';

import '../utils/styles.dart';
import 'animated_widgets/pulsing_widget.dart';

class LoadingWidget extends StatelessWidget {
  final String? loadingCound;
  final Color? color;
  const LoadingWidget({
    Key? key,
    this.loadingCound,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black100.withOpacity(0.5),
      body: Container(
        color: color ?? AppColors.black100.withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ImageFill(
                      boxHeight: HW.getWidth(200, context),
                      boxWidth: HW.getWidth(200, context),
                      loadingCount: int.parse(loadingCound!)),

                  // Image.asset(
                  //   AssetsPath.loadingVirus1,
                  //   width: HW.getWidth(200, context),
                  //   height: HW.getWidth(200, context),
                  // ),

                  // Visibility(
                  //   visible: int.parse(loadingCound!) >= 50,
                  //   child: Image.asset(
                  //     AssetsPath.loadingVirus2,
                  //     width: HW.getWidth(200, context),
                  //     height: HW.getWidth(200, context),
                  //   ),
                  // ),
                  // Visibility(
                  //   visible: int.parse(loadingCound!) == 99,
                  //   child: Image.asset(
                  //     AssetsPath.loadingVirus3,
                  //     width: HW.getWidth(200, context),
                  //     height: HW.getWidth(200, context),
                  //   ),
                  // ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (int.parse(loadingCound!) != 99)
                      const Text(
                        "LOADING  ",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    if (int.parse(loadingCound!) == 99)
                      const Text(
                        "  Click anywhere to start",
                        style: TextStyle(fontSize: 30, color: Colors.orange),
                      ),

                    // PulsingWidget(
                    //   duration: Times.medium,
                    //   tween: Tween(end: 0.25, begin: 1.5),
                    //   child: const Text(
                    //     "LOADING",
                    //     style: TextStyle(fontSize: 30, color: Colors.white),
                    //   ),
                    // ),
                    if (loadingCound != null && loadingCound != "99")
                      Text(
                        '$loadingCound%',
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
