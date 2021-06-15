import 'package:flutter/material.dart';

class CharacterModel extends StatelessWidget {
  const CharacterModel({required this.photo, this.onTap, required this.name});
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
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
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
