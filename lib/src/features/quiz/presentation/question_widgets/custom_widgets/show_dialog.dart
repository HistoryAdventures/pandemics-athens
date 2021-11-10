import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

class ShowDialogWidget extends StatelessWidget {
  final String accept;
  final String cancel;
  final String title;
  final String subTitle;
  final void Function() onTapAccept;
  final Function onTapCancel;

  const ShowDialogWidget({
    Key? key,
    required this.accept,
    required this.cancel,
    required this.onTapAccept,
    required this.onTapCancel,
    required this.subTitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(
              3,
            ),
          ),
          height: HW.getHeight(202, context),
          width: HW.getWidth(426, context),
          padding: EdgeInsets.all(HW.getWidth(24, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.overline!.copyWith(
                            color: Colors.white,
                            fontSize: HW.getHeight(24, context),
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      size: HW.getHeight(24, context),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              AutoSizeText(
                subTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(flex: 1, child: _buttons),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buttons => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 40,
          ),
          Expanded(
            flex: 40,
            child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  side: const BorderSide(
                    width: 2,
                    color: Colors.white,
                  ),
                  primary: Colors.transparent,
                ),
                onPressed: () {
                  onTapAccept();
                },
                child: Text(
                  accept,
                  style: const TextStyle(color: Colors.white),
                )),
          ),
          const Spacer(
            flex: 10,
          ),
          Expanded(
            flex: 40,
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  side: const BorderSide(
                    width: 2,
                    color: Colors.white,
                  ),
                  primary: AppColors.transpatent),
              onPressed: () {
                onTapCancel();
              },
              child: Text(
                cancel,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Spacer(
            flex: 40,
          )
        ],
      );
}
