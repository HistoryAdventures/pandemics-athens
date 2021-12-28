import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';

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
                      padding: EdgeInsets.only(top: HW.getHeight(64, context)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          widget.selectedImage,
                                          fit: BoxFit.contain,
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
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.only(
                                          top: HW.getHeight(32, context),
                                          bottom: HW.getHeight(64, context)),
                                      height: HW.getWidth(78, context),
                                      width: snapshot.data?.width,
                                      child: SingleChildScrollView(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          widget.selectedImageText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                fontSize:
                                                    TextFontSize.getHeight(
                                                        16, context),
                                                color: AppColors.white
                                                    .withOpacity(0.6),
                                                letterSpacing: 0.25,
                                                height: 26 / 16,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
