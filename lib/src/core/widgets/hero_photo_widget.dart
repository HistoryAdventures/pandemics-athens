import 'package:flutter/material.dart';

import '../colors.dart';

class CharacterModel extends StatelessWidget {
  final String photo;

  final VoidCallback? onTap;

  final String name;
  final double? height;
  final double? width;
  final String description;
  final VoidCallback? onTapHends;

  const CharacterModel(
      {Key? key,
      required this.photo,
      required this.name,
      required this.description,
      this.onTapHends,
      this.onTap,
      this.width,
      this.height})
      : super(key: key);
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
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                SizedBox(
                  child: Image.asset(
                    photo,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
