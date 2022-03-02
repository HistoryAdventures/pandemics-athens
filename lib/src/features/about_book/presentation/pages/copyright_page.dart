import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/social_media_icons.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';

import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class CopyrightPage extends StatefulWidget {
  const CopyrightPage({Key? key}) : super(key: key);

  @override
  _CopyrightPageState createState() => _CopyrightPageState();
}

class _CopyrightPageState extends State<CopyrightPage> {
  late AppLocalizations locale;

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsPath.charactersBackgroundImage),
              fit: BoxFit.cover),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    top: HW.getHeight(128, context),
                    child: Container(
                      alignment: Alignment.center,
                      height: HW.getHeight(43, context),
                      child: Text(
                        locale.copyright.toUpperCase(),
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontSize: TextFontSize.getHeight(36, context)),
                      ),
                    )),
                SoundAndMenuWidget(
                  icons: AudioPlayerUtil.isSoundOn
                      ? AssetsPath.iconVolumeOn
                      : AssetsPath.iconVolumeOff,
                  onTapVolume: AudioPlayerUtil.isSoundOn
                      ? () {
                          setState(() {
                            AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                   
                          });
                        }
                      : () {
                          setState(() {
                            AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                      
                          });
                        },
                  onTapMenu: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ArrowLeftTextWidget(
                            textSubTitle: locale.furtherReading,
                            textTitle: locale.aboutTheBook,
                            onTap: () {
                              LeafDetails.currentVertex = 26;
                              LeafDetails.visitedVertexes.add(26);
                              NavigationSharedPreferences
                                  .upDateShatedPreferences();
                              context.router
                                  .replace(const FurtherReadingPageToRight());
                            }),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SocialMediaIcons(),
                            SizedBox(
                              height: HW.getHeight(45, context),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: constraints.maxHeight * 0.8,
                      margin: EdgeInsets.only(
                          left: constraints.maxWidth * 0.1,
                          right: constraints.maxWidth * 0.1,
                          bottom: 80,
                          top: constraints.maxHeight * 0.25),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    authorWidget(
                                        'Copyright © Spencer Striker, 2021', [
                                      'All rights reserved. No part of this book may be reproduced or used in any manner without written permission of the copyright owner except for the use of quotations in a book review. For more information, address: spencerstriker@gmail.comThis is a work of fiction. Names, characters, places, and incidents either are the product of the author’s imagination or are used fictitiously. Any resemblance to actual persons, living or dead, events, or locales is entirely coincidental.'
                                    ]),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    authorWidget('Fair Use', [
                                      'Copyright Disclaimer under section 107 of the Copyright Act of 1976, allowance is made for “fair use” for purposes such as criticism, comment, news reporting, teaching, scholarship, education and research. Fair use is a use permitted by copyright statute that might otherwise be infringing.'
                                    ]),
                                    authorWidget('Fair Use Definition', [
                                      'Fair use is a doctrine in United States copyright law that allows limited use of copyrighted material without requiring permission from the rights holders, such as commentary, criticism, news report- ing, research, teaching or scholarship. It provides for the legal, non-licensed citation or incorporation of copyrighted material in another author’s work under a four-factor balancing test.'
                                    ]),
                                    authorWidget('Fair Use Act Disclaimer', [
                                      'This is a work of criticism, comment, scholarship and research.',
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget authorWidget(String profession, List<String> peoples) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: AutoSizeText(
                    profession.toUpperCase(),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: peoples.map((people) {
              return Container(
                margin: const EdgeInsets.only(bottom: 36),
                child: AutoSizeText(
                  people,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: AppColors.greyDeep, fontSize: 16),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
