import 'package:flutter/material.dart';

import '../colors.dart';

class ManBodyModel extends StatelessWidget {
  const ManBodyModel({required this.photo, this.onTap, required this.name});
  final String photo;
  final VoidCallback? onTap;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.white.withOpacity(0),
          child: InkWell(
            splashColor: AppColors.transpatent,
            highlightColor: AppColors.transpatent,
            focusColor: AppColors.transpatent,
            hoverColor: AppColors.transpatent,
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
