import 'package:flutter/material.dart';
import '../../../../../core/colors.dart';

class CustumInput extends StatelessWidget {
  final String hintText;

  final FormFieldSetter<String> onSaved;
  final TextEditingController controller;
  final bool obscureText;
  const CustumInput({
    required this.hintText,
    required this.onSaved,
    required this.controller,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: TextFormField(
        onSaved: onSaved,
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(fontSize: 20, color: Colors.black),
        decoration: InputDecoration(
          contentPadding:const EdgeInsets.all(10),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: AppColors.blueDeep, width: 1)),
          isDense: true,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: AppColors.blueDeep),
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: AppColors.blueDeep, width: 1)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: AppColors.blueDeep, width: 1)),
        ),
      ),
    );
  }
}
