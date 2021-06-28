import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/background_widget.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_right.dart';
import 'package:history_of_adventures/src/core/widgets/clickable_widget.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';

class PathogenProfilePage extends StatefulWidget {
  const PathogenProfilePage({Key? key}) : super(key: key);

  @override
  _PathogenProfilePageState createState() => _PathogenProfilePageState();
}

class _PathogenProfilePageState extends State<PathogenProfilePage> {
  int _selectedItem = 400;
  //final _scrollController = ScrollController();
  late AppLocalizations locals;
  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            const BackgroundWidget(),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      height: constraints.maxHeight * 0.6,
                      width: constraints.maxWidth * 0.6,
                      color: Colors.white.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: AutoSizeText(locals.chapter1,
                                              maxLines: 1,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2),
                                        ),
                                        Flexible(
                                          child: AutoSizeText(
                                            locals.pathogenProfile
                                                .toUpperCase(),
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Scrollbar(
                                      child:
                                          ListView(shrinkWrap: true, children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, right: 30),
                                          child: AutoSizeText(
                                            locals.pathogenProfileText,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: BlobAnimation(
                          height: constraints.maxHeight * 0.5,
                          width: constraints.maxWidth * 0.5),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: ArrowRightTextWidget(
                    textSubTitle: locals.whereDidItComeFrom,
                    textTitle: locals.pathogenProfile,
                    onTap: () {
                      context.router.push(const VirusLocationPageRoute());
                    }),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Clickable(
                onPressed: () {},
                child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.all(24),
                    child: Image.asset(AssetsPath.scrollIcon)),
              ),
            )
          ],
        );
      }),
    );
  }

  void chandeState(int? selctedItem) {
    setState(() {
      _selectedItem = selctedItem!;
    });
  }

  Widget yearsWidget({int? index, int? selected}) {
    return Container(
        //padding: const EdgeInsets.only(),
        alignment: Alignment.center,
        // color: Colors.red,
        margin: const EdgeInsets.only(
          left: 30,
        ),
        child: Clickable(
            onPressed: () {
              chandeState(selected);
            },
            child: Text(
              "${400 + index!}",
              style: _selectedItem == selected
                  ? const TextStyle(
                      color: AppColors.orange,
                      fontSize: 36,
                    )
                  : const TextStyle(color: AppColors.blackB, fontSize: 15),
            )));
  }
}
