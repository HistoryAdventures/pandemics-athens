import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

class PanelWidget extends StatelessWidget {
  final String text;
  const PanelWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          width: HW.getWidth(772, context),
          height: HW.getHeight(384, context),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: AppColors.blackG.withOpacity(0.75),
            borderRadius: BorderRadius.circular(3),
            border:
                Border.all(width: 0.5, color: Colors.white.withOpacity(0.15)),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border:
                  Border.all(width: 0.5, color: Colors.white.withOpacity(0.15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: ListView(
                padding: const EdgeInsets.all(14),
                children: [
                  Text(
                    text,
                    strutStyle: const StrutStyle(
                      fontSize: 16.0,
                      height: 1.3,
                    ),
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: AppColors.white.withOpacity(0.6),
                          fontSize: 12,
                          letterSpacing: 0.25,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
