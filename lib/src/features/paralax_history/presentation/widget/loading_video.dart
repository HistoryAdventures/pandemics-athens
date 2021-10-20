import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';

class LoadingVideoWidget extends StatelessWidget {
  const LoadingVideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black100,
      body: Container(
        color: AppColors.black100,
        child: Center(
          child: PulsingWidget(
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
