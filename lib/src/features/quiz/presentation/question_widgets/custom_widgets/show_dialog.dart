import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:history_of_adventures/src/core/colors.dart';

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
              color: AppColors.blueDeep,
              borderRadius: BorderRadius.circular(20)),
          height: 200,
          padding: EdgeInsets.all(10),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                subTitle,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: AppColors.red),
                        onPressed: () {
                          onTapAccept();
                        },
                        child: Text(accept)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              width: 1,
                              color: Colors.white,
                            ),
                            primary: AppColors.transpatent),
                        onPressed: () {
                          onTapCancel();
                        },
                        child: Text(cancel)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
