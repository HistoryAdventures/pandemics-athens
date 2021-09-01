import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';

class AuthorWidget extends StatelessWidget {
  final String profession;
  final List<String> peoples;
  final BoxBorder? border;
  const AuthorWidget(
      {Key? key, required this.peoples, required this.profession, this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 128, bottom: 31),
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
                  child: AutoSizeText(
                    profession.toUpperCase(),
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: AppColors.grey, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: peoples.map((people) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: border ??
                      const Border(
                        bottom: BorderSide.none,
                      ),
                ),
                child: AutoSizeText(
                  people,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 16),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
