import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/animated_loading.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import '../colors.dart';

import '../utils/styles.dart';
import 'animated_widgets/pulsing_widget.dart';

class LoadingWidget extends StatelessWidget {
  final String? loadingCound;
  final Color? color;
  final bool? userIteract;
  const LoadingWidget({
    Key? key,
    this.loadingCound,
    this.userIteract,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black100.withOpacity(0.5),
      body: Container(
        color: color ?? AppColors.black100.withOpacity(0.5),
        child: Center(
          child: loadingCound != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageFill(
                        boxHeight: HW.getWidth(200, context),
                        boxWidth: HW.getWidth(200, context),
                        loadingCount: int.parse(loadingCound!)),
                    Container(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (int.parse(loadingCound!) != 99)
                            const Text(
                              "LOADING  ",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          if (int.parse(loadingCound!) == 99 && userIteract == null)
                            const Text(
                              "  Click anywhere to start",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.orange),
                            ),
                          if (loadingCound != null && loadingCound != "99")
                            Text(
                              '$loadingCound%',
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            )
                        ],
                      ),
                    ),
                  ],
                )
              : PulsingWidget(
                  duration: Times.medium,
                  tween: Tween(end: 0.25, begin: 1.5),
                  child: const Text(
                    "Loading...",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
        ),
      ),
    );
  }
}
