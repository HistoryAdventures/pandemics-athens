import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import '../../../../../core/colors.dart';

class CustumInput extends StatelessWidget {
  final String hintText;
  final String rightAnswer;

  final FormFieldSetter<String> onSaved;
  final TextEditingController controller;
  bool? isCorrect;
  CustumInput({
    required this.hintText,
    required this.onSaved,
    required this.controller,
    required this.rightAnswer,
    this.isCorrect,
  });
  @override
  Widget build(BuildContext context) {
    return isCorrect == null
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              cursorHeight: TextFontSize.getHeight(16, context),
              textAlign: TextAlign.center,
              onSaved: onSaved,
              controller: controller,
              style: TextStyle(
                  fontSize: TextFontSize.getHeight(16, context),
                  color: isCorrect == null
                      ? Colors.green
                      : isCorrect!
                          ? AppColors.green
                          : AppColors.red,
                  decoration: isCorrect == null
                      ? TextDecoration.none
                      : isCorrect!
                          ? TextDecoration.none
                          : TextDecoration.lineThrough),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.underlineInputBorderColor, width: 1)),
                isDense: true,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: TextFontSize.getHeight(16, context),
                    color: AppColors.blueDeep),
                hintText: hintText,
                focusedBorder: const UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: AppColors.underlineInputBorderColor, width: 1)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.underlineInputBorderColor, width: 1)),
              ),
            ),
          )
        : isCorrect!
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  cursorHeight: HW.getHeight(16, context),
                  textAlign: TextAlign.center,
                  onSaved: onSaved,
                  controller: controller,
                  style: TextStyle(
                      fontSize: TextFontSize.getHeight(16, context),
                      color: isCorrect == null
                          ? Colors.green
                          : isCorrect!
                              ? AppColors.green
                              : AppColors.red,
                      decoration: isCorrect == null
                          ? TextDecoration.none
                          : isCorrect!
                              ? TextDecoration.none
                              : TextDecoration.lineThrough),
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.underlineInputBorderColor,
                            width: 1)),
                    isDense: true,
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: TextFontSize.getHeight(16, context),
                        color: AppColors.blueDeep),
                    hintText: hintText,
                    focusedBorder: const UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(
                            color: AppColors.underlineInputBorderColor,
                            width: 1)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.underlineInputBorderColor,
                            width: 1)),
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.underlineInputBorderColor,
                                width: 1))),
                    child: controller.text == ""
                        ? Column(
                            children: [
                              Text(
                                rightAnswer,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        color: AppColors.blueDeep,
                                        fontSize: TextFontSize.getHeight(
                                            12, context)),
                              ),
                              Text(
                                '*empty*',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        color: AppColors.red,
                                        fontSize:
                                            TextFontSize.getHeight(12, context),
                                        decoration: TextDecoration.lineThrough),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Text(
                                rightAnswer,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        color: AppColors.blueDeep,
                                        fontSize: TextFontSize.getHeight(
                                            12, context)),
                              ),
                              Text(
                                controller.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        color: AppColors.red,
                                        fontSize:
                                            TextFontSize.getHeight(16, context),
                                        decoration: TextDecoration.lineThrough),
                              )
                            ],
                          )),
              );
  }
}
