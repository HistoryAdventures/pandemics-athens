import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:universal_html/js.dart';
import 'package:auto_route/auto_route.dart';

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
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
          gradient: AppColors.linearGradientBlueBK,
            // image: DecorationImage(
            //   image: AssetImage(AssetsPath.dialogImageBg),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: FadeTransition(
            opacity: widget.animation,
            child: FutureBuilder<Size>(
                future: imageSize(),
                builder: (context, snapshot) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(top:HW.getHeight(63, context),bottom: HW.getHeight(175, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            widget.selectedImage,
                            fit: BoxFit.cover,
                            key: imageKey,
                          ),
                          IconButtonWidget(
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.grey,
                              ),
                              onPressed: () {
                                context.router.pop();
                              })
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
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
