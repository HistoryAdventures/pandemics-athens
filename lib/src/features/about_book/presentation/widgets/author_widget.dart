import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/about_book/models/url_luncher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/colors.dart';

class AuthorWidget extends StatelessWidget {
  final String profession;
  final List<UrlLuncherModel> urlModeles;
  final TextDecoration? textDecoration;

  const AuthorWidget(
      {Key? key,
      required this.urlModeles,
      required this.profession,
      this.textDecoration})
      : super(key: key);

  Future<bool> _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: HW.getHeight(30, context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: HW.getHeight(4, context),
                  ),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: AppColors.grey, width: 1),
                  )),
                  child: Text(
                    profession.toUpperCase(),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: "OpenSans",
                        fontSize: TextFontSize.getHeight(12, context)),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: urlModeles.map((model) {
              return InkWell(
                onTap: model.url == null
                    ? null
                    : () {
                        _launchURL(model.url!);
                      },
                child: Container(
                  margin: EdgeInsets.only(top: HW.getHeight(8, context)),
                  child: Text(
                    model.title,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: TextFontSize.getHeight(17, context),
                        decoration: textDecoration ?? TextDecoration.underline,
                        height: 1.3,
                        fontWeight: FontWeight.w500,
                        fontFamily: "OpenSans",
                        decorationColor: Colors.black),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
