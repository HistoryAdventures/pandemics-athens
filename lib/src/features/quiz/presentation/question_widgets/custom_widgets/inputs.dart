import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import '../../../../../core/colors.dart';

class CustumInput extends StatelessWidget {
  final String hintText;

  final FormFieldSetter<String> onSaved;
  final TextEditingController controller;
  bool? isCorrect;
  CustumInput({
    required this.hintText,
    required this.onSaved,
    required this.controller,
    this.isCorrect,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: TextFormField(
        onSaved: onSaved,
        controller: controller,
        style: TextStyle(
            fontSize: TextFontSize.getHeight(30, context), color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                  color: isCorrect == null
                      ? AppColors.blueDeep
                      : isCorrect!
                          ? AppColors.green
                          : AppColors.red,
                  width: 1)),
          isDense: true,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: AppColors.blueDeep),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                  color: isCorrect == null
                      ? AppColors.blueDeep
                      : isCorrect!
                          ? AppColors.green
                          : AppColors.red,
                  width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                  color: isCorrect == null
                      ? AppColors.blueDeep
                      : isCorrect!
                          ? AppColors.green
                          : AppColors.red,
                  width: 1)),
        ),
      ),
    );
  }
}
