import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import '../../../../core/colors.dart';

class AuthorWidget extends StatelessWidget {
  final String profession;
  final List<String> peoples;
  final TextDecoration? textDecoration;
  const AuthorWidget(
      {Key? key,
      required this.peoples,
      required this.profession,
      this.textDecoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 10,
          right: MediaQuery.of(context).size.width * 0.0628,
          bottom: 31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: AppColors.grey, width: 1),
                  )),
                  child: Text(
                    profession.toUpperCase(),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: AppColors.grey,
                        fontSize: TextFontSize.getHeight(12, context)),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: peoples.map((people) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  people,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: TextFontSize.getHeight(16, context),
                      decoration: textDecoration ?? TextDecoration.underline,
                      height: 2,
                      decorationColor: Colors.black),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
