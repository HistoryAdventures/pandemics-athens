import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/envirement.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: SocialMediaIconViewModel.models
              .map((e) => InkWell(
                    onTap: () => onViewModelTap(e),
                    child: Container(
                      margin: EdgeInsets.only(
                        right:
                            e.itemisLastInList() ? 0 : HW.getWidth(24, context),
                      ),
                      width: HW.getWidth(25, context),
                      height: HW.getWidth(25, context),
                      child: Image.asset(e.asset),
                    ),
                  ))
              .toList(),
        ),
        SizedBox(
          height: HW.getHeight(13, context),
        ),
        InkWell(
          onTap: () async {
            if (await canLaunch(Envirement.webPage)) {
              launch(Envirement.webPage);
            }
          },
          child: AutoSizeText(
            'www.historyadventures.co',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: HW.getWidth(15.9, context),
              height: 1,
              fontFamily: "OpenSans",
              color: Colors.black.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  void onViewModelTap(SocialMediaIconViewModel e) async {
    if (await canLaunch(e.link)) {
      launch(e.link);
    }
    ;
  }
}

class SocialMediaIconViewModel {
  final String asset;
  final String link;
  const SocialMediaIconViewModel({
    required this.asset,
    required this.link,
  });

  static const List<SocialMediaIconViewModel> models = [
    SocialMediaIconViewModel(
        asset: AssetsPath.facebook, link: Envirement.faceBook),
    SocialMediaIconViewModel(
        asset: AssetsPath.twitter, link: Envirement.twitter),
    SocialMediaIconViewModel(
        asset: AssetsPath.instagram, link: Envirement.instagram),
    SocialMediaIconViewModel(
        asset: AssetsPath.linkedin, link: Envirement.linkedIn),
    SocialMediaIconViewModel(
        asset: AssetsPath.youtube, link: Envirement.youTube),
  ];

  bool itemisLastInList() {
    return models.indexOf(this) == models.length - 1;
  }
}
