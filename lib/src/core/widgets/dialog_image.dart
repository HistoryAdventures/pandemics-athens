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
                width: snapshot.data?.width,
                height: snapshot.data?.width,
                margin: EdgeInsets.symmetric(
                    vertical: widget.constraints.maxHeight * 0.1),
                child: Scaffold(
                  backgroundColor: AppColors.white,
                  body: Center(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                widget.selectedImage,
                                fit: BoxFit.contain,
                                key: imageKey,
                              ),
                            ),
                          ),
                          FutureBuilder<Size>(
                              future: imageSize(),
                              builder: (context, snapshot) {
                                return SizedBox(
                                  width: snapshot.data?.width,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      widget.selectedImageText,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Future<Size> imageSize() async {
    await Future.delayed(const Duration(milliseconds: 10));

    RenderBox? renderBox =
        imageKey.currentContext!.findRenderObject()! as RenderBox;

    return renderBox.size;
  }
}
