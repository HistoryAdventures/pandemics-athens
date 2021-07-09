import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/clickable_widget.dart';

class LearnmorePage extends StatefulWidget {
  @override
  _LearnmorePageState createState() => _LearnmorePageState();
}

class _LearnmorePageState extends State<LearnmorePage> {
  late AppLocalizations locals;
  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white.withOpacity(0.1), body: _body());
  }

  Widget _body() {
    return Stack(
      children: [
        Align(
            alignment: Alignment.bottomCenter,
            child: Clickable(
              onPressed: () {
                context.router.pop();
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: AppColors.white.withOpacity(0.1),
                )),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              locals.learnMore.toUpperCase(),
                              minFontSize: 5,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: AppColors.white, fontSize: 10),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                  width: 10,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.white,
                                  ),
                                ),
                                AutoSizeText(
                                  locals.athens5thCentury.toUpperCase(),
                                  minFontSize: 5,
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
