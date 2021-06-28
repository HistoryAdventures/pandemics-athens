import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/background_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class GlossaryPage extends StatefulWidget {
  const GlossaryPage({Key? key}) : super(key: key);

  @override
  _GlossaryPageState createState() => _GlossaryPageState();
}

class _GlossaryPageState extends State<GlossaryPage> {
  String _selectedtItem = 'SOSovereighty';
  List<String> category = [
    'SOSovereighty',
    'SPHistogram Obscura',
    'SEHistogram Obscura',
    'AUHistogram Obscura',
    'MEHistogram Obscura',
    'SRHistogram Obscura',
    'ALHistogram Obscura',
    'SPHistogram Obscura',
    'SEHistogram Obscura',
    'AUHistogram Obscura',
    'MEHistogram Obscura',
    'SRHistogram Obscura',
    'ALHistogram Obscura',
    'SPHistogram Obscura',
    'SEHistogram Obscura',
    'AUHistogram Obscura',
    'MEHistogram Obscura',
    'SRHistogram Obscura',
    'ALHistogram Obscura',
    'SPHistogram Obscura',
    'SEHistogram Obscura',
    'AUHistogram Obscura',
    'MEHistogram Obscura',
    'SRHistogram Obscura',
    'ALHistogram Obscura',
    'SPHistogram Obscura',
    'SEHistogram Obscura',
    'AUHistogram Obscura',
    'MEHistogram Obscura',
    'SRHistogram Obscura',
  ];
  late AppLocalizations locales;
  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        // final diagonal = sqrt((constraints.maxHeight * constraints.maxHeight) +
        //     (constraints.maxWidth * constraints.maxWidth));
        return Stack(
          children: [
            const BackgroundWidget(),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                color: AppColors.blackB,
                iconSize: 40,
                icon: const Icon(Icons.south),
                onPressed: () {
                  context.router.push(const ParalaxHistoryPageRoute());
                },
              ),
            ),
            Positioned(
              top: constraints.maxHeight * 0.06,
              right: constraints.maxWidth * 0.06,
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 45,
                ),
                onPressed: () {},
              ),
            ),
            Positioned(
              top: constraints.maxHeight * 0.06,
              left: constraints.maxWidth * 0.06,
              child: IconButton(
                icon: const Icon(
                  Icons.volume_up,
                  size: 45,
                ),
                onPressed: () {},
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: constraints.maxHeight * 0.13),
                  child: AutoSizeText(
                    locales.glosssary.toUpperCase(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )),
            Align(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.1),
                width: constraints.maxWidth * 0.9,
                height: constraints.maxHeight * 0.5,
                decoration: const BoxDecoration(
                    gradient: AppColors.linearGradientForBackground),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding:
                            EdgeInsets.only(left: constraints.maxWidth * 0.05),
                        width: constraints.maxWidth * 0.4,
                        height: constraints.maxHeight * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                child: AutoSizeText(
                              locales.sovereignty,
                              maxLines: 1,
                              minFontSize: 5,
                              style: Theme.of(context).textTheme.headline5,
                            )),
                            Flexible(
                                child: AutoSizeText(
                              locales.sovereigntyText,
                              minFontSize: 5,
                              style: Theme.of(context).textTheme.bodyText1,
                            ))
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        height: constraints.maxHeight * 0.5,
                        width: constraints.maxHeight * 0.5,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent:
                                      constraints.maxHeight * 0.5 / 5,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 1),
                          itemCount: 25,
                          itemBuilder: (context, index) {
                            return gridViewCard(
                                name: category[index],
                                category: category[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void selectedItem({
    required String cardTitele,
  }) {
    setState(() {
      _selectedtItem = cardTitele;
    });
  }

  Widget gridViewCard({
    required String name,
    required String category,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        selectedItem(cardTitele: name);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.3),
            gradient: _selectedtItem == name
                ? AppColors.linearGradient1
                : AppColors.linearGradient2,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Flexible(
              child: AutoSizeText(category.substring(0, 2),
                  maxLines: 1,
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: AppColors.white)),
            ),
            Flexible(
              child: AutoSizeText(category.substring(2).toUpperCase(),
                  maxLines: category.allMatches(" ").length == 1 ? 1 : 2,
                  minFontSize: 5,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: AppColors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
