import 'package:flutter/material.dart';
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
              PulsingWidget(
                duration: Times.medium,
                tween: Tween(end: 0.25, begin: 1.5),
                child: const Text(
                  "Loading...",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              if (loadingCound != null)
                Text(
                  '$loadingCound%',
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                )
            ],
          ),
        ),
      ),
    );
  }
}
