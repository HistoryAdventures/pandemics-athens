import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({
    required this.selectedImg,
    required this.selectedText,
    required this.animation,
    required this.size,
  });

  final String selectedImg;
  final String selectedText;
  final Animation<double> animation;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: FadeTransition(
        //position: widget.animation.drive(widget.tween),
        opacity: animation,
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.2, vertical: size.height * 0.15),
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      selectedImg,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        selectedText,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
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
