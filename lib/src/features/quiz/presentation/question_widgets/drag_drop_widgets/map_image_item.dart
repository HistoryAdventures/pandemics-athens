import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/map_quiz_model.dart';

class MapImageItem extends StatelessWidget {
  final MapQuizItemModel model;
  const MapImageItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   model.title,
        //   style: Theme.of(context).textTheme.overline!.copyWith(
        //         fontSize: HW.getHeight(18, context),
        //         fontWeight: FontWeight.bold,
        //       ),
        // ),
        SizedBox(
          width: HW.getWidth(16, context),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              model.assets,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
