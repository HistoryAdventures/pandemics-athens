
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/background_widget.dart';
import 'package:history_of_adventures/src/core/widgets/virus_animation_widget.dart';

import '../../../../core/colors.dart';
import '../../../../core/theme.dart';
import '../../../../core/widgets/clickable_widget.dart';
import 'gif_contrrol.dart';

class VirusesInfoPage extends StatefulWidget {
  const VirusesInfoPage({Key? key}) : super(key: key);

  @override
  _VirusesInfoPageState createState() => _VirusesInfoPageState();
}

class _VirusesInfoPageState extends State<VirusesInfoPage>
    with SingleTickerProviderStateMixin {
  /// Localizations object
  late AppLocalizations locals;
  late GifController controller;

  List<int> frames = [151, 151];
  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  // Map<String, MemoryImage?> images = {};
  // Future<void> loadData() async {
  //   List<String> gifData = [
  //     'assets/virus_gif/virus1.gif',
  //     'assets/virus_gif/virus2.gif'
  //   ];
  //   for (var item in gifData) {
  //     final ByteData data = await rootBundle.load(item);

  //     images[item] = MemoryImage(Uint8List.view(data.buffer));
  //   }
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  String _selectedItem = "intro";
  String _selectedImg = 'assets/virus_gif/virus1.gif';

  @override
  void initState() {
    super.initState();
    // scheduleMicrotask(() async =>  loadData());
    controller = GifController(vsync: this);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controller.repeat(
        min: 0,
        max: 150,
        period: const Duration(seconds: 4),
        reverse: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<VirusModel> listCharacters = [
      VirusModel(
        name: locals.introVirus,
        widget: 'assets/virus_gif/virus1.gif',
      ),
      VirusModel(
        widget: 'assets/virus_gif/virus2.gif',
        name: locals.bubonicPlague,
      ),
      VirusModel(
        widget: 'assets/virus_gif/virus3.gif',
        name: locals.typhus,
      ),
      VirusModel(
        widget: 'assets/virus_gif/virus1.gif',
        name: locals.typhiod,
      ),
      VirusModel(
        widget: 'assets/virus_gif/virus2.gif',
        name: locals.smallpox,
      ),
      VirusModel(
        widget: 'assets/virus_gif/virus1.gif',
        name: locals.ebola,
      )
    ];
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          Align(
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 80,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: GifImage(
                    image: AssetImage(_selectedImg),
                    controller: controller,
                  )),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 50,
                          top: size.height * 0.1,
                          bottom: size.height * 0.1),
                      decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.5)),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: AutoSizeText(
                                    locals.chapter1Name.toUpperCase(),
                                    maxLines: 1,
                                    style: DefaultTheme
                                        .standard.textTheme.subtitle2,
                                  ),
                                ),
                                Flexible(
                                  child: AutoSizeText(_selectedItem,
                                      style: DefaultTheme
                                          .standard.textTheme.headline2),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: AppColors.grey, width: 1.2),
                                      bottom: BorderSide(
                                          color: AppColors.grey, width: 1.2))),
                              child: Scrollbar(
                                isAlwaysShown: true,
                                child: ListView(shrinkWrap: true, children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: '415, Battle of Thermopylae\n',
                                        style: DefaultTheme
                                            .standard.textTheme.headline3,
                                      ),
                                      TextSpan(
                                        text: text,
                                        style: DefaultTheme
                                            .standard.textTheme.bodyText1,
                                      ),
                                    ])),
                                  )
                                ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: listCharacters
                                        .map((data) => virusesNameListWidget(
                                            image: data.widget,
                                            name: data.name,
                                            selected: data.name))
                                        .toList())),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeState(String? selctedItem, String? slectedImg) {
    setState(() {
      _selectedItem = selctedItem!;
      _selectedImg = slectedImg!;
      //  print(_selectedImg);
    });
  }

  Widget virusesNameListWidget(
      {String? name, String? selected, String? image}) {
    return Container(
        margin: const EdgeInsets.only(left: 30),
        child: Clickable(
          onPressed: () {
            changeState(selected, image);
          },
          child: AutoSizeText(name!.toUpperCase(),
              maxLines: 1,
              style: _selectedItem == selected
                  ? Theme.of(context).textTheme.bodyText1
                  : Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.grey)),
        ));
  }
}

const String text = '''
    
In the aftermath of Athens’ defeat and the recovery from the devastation wrought by both war and plague, the political landscape of the city fractured.

At first, democracy was a victim. Despite enduring through the year of plague, it had increasingly found starting to creak under the strain of war. In 406 BC for example, 
the Athenian navy had rallied, defeating the Spartans at the Battle of Arginusae. The failure of the commanders to capitalise on this victory however (through no fault of their own, merely bad weather), 
led to a trial in Athens at which six leading naval commanders were executed. This would severely undermine the capacity of the Athenian forces in future.
In the aftermath of Athens’ defeat and the recovery from the devastation wrought by both war and plague, the political landscape of the city fractured.

At first, democracy was a victim. Despite enduring through the year of plague, it had increasingly found starting to creak under the strain of war. In 406 BC for example, 
the Athenian navy had rallied, defeating the Spartans at the Battle of Arginusae. The failure of the commanders to capitalise on this victory however (through no fault of their own, merely bad weather), 
led to a trial in Athens at which six leading naval commanders were executed. This would severely undermine the capacity of the Athenian forces in future.''';
