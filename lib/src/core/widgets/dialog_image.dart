import 'package:flutter/material.dart';

import '../colors.dart';

class DialogImageWidget extends StatefulWidget {
  final Animation<double> animation;
  final String selectedImage;
  final BoxConstraints constraints;
  final String selectedImageText;

  const DialogImageWidget({
    Key? key,
    required this.animation,
    required this.selectedImage,
    required this.selectedImageText,
    required this.constraints,
  }) : super(key: key);

  @override
  _DialogImageWidgetState createState() => _DialogImageWidgetState();
}

class _DialogImageWidgetState extends State<DialogImageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FadeTransition(
        opacity: widget.animation,
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: widget.constraints.maxWidth * 0.2,
              vertical: widget.constraints.maxHeight * 0.15),
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        widget.selectedImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.selectedImageText,
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
