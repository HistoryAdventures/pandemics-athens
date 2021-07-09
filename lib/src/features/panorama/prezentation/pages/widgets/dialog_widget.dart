import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/widgets/clickable_widget.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class DialogWidget extends StatelessWidget {
  final Animation<double> animation;
  final Animatable<Offset> tween;
  final BoxConstraints constraints;
  final AppLocalizations locals;

  const DialogWidget(
      {Key? key,
      required this.animation,
      required this.tween,
      required this.constraints,
      required this.locals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SlideTransition(
        position: animation.drive(tween),
        child: Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          margin: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.15,
              vertical: constraints.maxHeight * 0.2),
          child: Scaffold(
              backgroundColor: AppColors.white,
              body: Container(
                margin: const EdgeInsets.all(24),
                // height: constraints.maxHeight * 0.6,
                // width: constraints.maxWidth * 0.6,
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: constraints.maxHeight,
                      child: Image.asset(
                        'assets/image_back/image_71.png',
                        fit: BoxFit.cover,
                      ),
                    )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: AutoSizeText(
                                              AppLocalizations.of(context)!
                                                  .chapter1Name
                                                  .toUpperCase(),
                                              maxLines: 1,
                                              minFontSize: 5,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                                locals.chapter1Name,
                                                minFontSize: 5,
                                                maxLines: 1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: Clickable(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Icon(Icons.clear)))
                                  ])),
                              Flexible(
                                flex: 3,
                                child: Scrollbar(
                                  child: ListView(shrinkWrap: true, children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 30),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: locals.battleOfThermopylae,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                        TextSpan(
                                          text: locals.bodyText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ])),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
