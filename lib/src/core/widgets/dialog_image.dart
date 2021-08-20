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
                color: AppColors.green,
                width: snapshot.data?.width,
                height: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                    vertical: widget.constraints.maxHeight * 0.1),
                child: Scaffold(
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Image.asset(
                            widget.selectedImage,
                            fit: BoxFit.cover,
                            key: imageKey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: snapshot.data?.width,
                          child: SingleChildScrollView(
                            child: Text(
                              widget.selectedImageText,
                              style: Theme.of(context).textTheme.subtitle1,
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
