import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

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

  final GlobalKey imageKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FadeTransition(
        opacity: widget.animation,
        child: FutureBuilder<Size>(
            future: imageSize(),
            builder: (context, snapshot) {
              return Container(
                color: AppColors.green,
                width: snapshot.data?.width,
                // height: MediaQuery.of(context).size.height,
                child: Scaffold(
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Image.asset(
                          widget.selectedImage,
                          fit: BoxFit.cover,
                          key: imageKey,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: snapshot.data?.width,
                          child: Scrollbar(
                            isAlwaysShown: true,
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                              child: Text(
                                widget.selectedImageText,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                        fontSize: TextFontSize.getHeight(
                                            24, context)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Future<Size> imageSize() async {
    await Future.delayed(const Duration(milliseconds: 10));

    final RenderBox renderBox =
        imageKey.currentContext!.findRenderObject()! as RenderBox;

    return renderBox.size;
  }
}
