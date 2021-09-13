import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';

import '../utils/styles.dart';
import 'animated_widgets/pulsing_widget.dart';

class LoadingWidget extends StatelessWidget {
  final String loadingCound;
  const LoadingWidget({
    Key? key,
    required this.loadingCound,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black100.withOpacity(0.5),
      body: Container(
        color: AppColors.black100.withOpacity(0.5),
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
