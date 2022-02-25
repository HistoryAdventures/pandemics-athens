import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/widgets/arrow_left.dart';
import '../../../../core/widgets/arrow_right.dart';

class PracticeMedicine extends StatefulWidget {
  const PracticeMedicine({Key? key}) : super(key: key);

  @override
  _PracticeMedicineState createState() => _PracticeMedicineState();
}

class _PracticeMedicineState extends State<PracticeMedicine> {
  late AppLocalizations locals;

  bool isImageloaded = false;
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  Offset offset = const Offset(0, 0);
  List<String> contentImages = [
    AssetsPath.medicine,
    AssetsPath.quitMedicine,
    AssetsPath.keepGoing,
    AssetsPath.deadOfSocrates1,
    AssetsPath.deadOfSocrates2,
    AssetsPath.deadOfSocrates3,
    AssetsPath.endOfWar1,
    AssetsPath.endOfWar2,
    AssetsPath.endOfWar3,
  ];

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  // Future<void> init() async {
  //   final loadedAssets = await loadContent(contentImages);
  //   if (loadedAssets == true) {
  //     setState(() {
  //       isImageloaded = true;
  //     });
  //   } else {
  //     setState(() {
  //       isImageloaded = false;
  //     });
  //   }
  // }

  @override
  void initState() {
    //init();
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (isImageloaded == false) {
    //   return LoadingWidget();
    // }
    return Stack(
      children: [
        SizedBox.expand(
            child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
              child: Image.asset(
            AssetsPath.medicine,
            fit: BoxFit.cover,
          )),
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: HW.getWidth(64, context)),
            height: HW.getHeight(161, context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: ArrowLeftWidget(
                        arrowColor: AppColors.white,
                        textSubTitle: locals.quitMedicine,
                        textTitle: '',
                        textColor: AppColors.white,
                        onTap: () {
                          context.router.replace(const QuitMedicinePageRoute());
                        }),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: AutoSizeText(
                      locals.medicine.toUpperCase(),
                      maxLines: 1,
                      minFontSize: 5,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 38,
                          fontWeight: FontWeight.normal,
                          color: AppColors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ArrowRightWidget(
                      textColor: AppColors.white,
                      textSubTitle: locals.keepGoing,
                      textTitle: '',
                      arrowColor: AppColors.white,
                      onTap: () {
                        ////????????
                        NavigationSharedPreferences.upDateShatedPreferences();
                        context.router.replace(const KeepGoingPageLeftRoute());
                      }),
                ),
              ],
            ),
          ),
        ),
        // SoundAndMenuWidget(
        //   color: AppColors.white,
        //   // widget: IconButtonWidget(
        //   //     onPressed: () {
        //   //       LeafDetails.currentVertex = 10;
        //   //       NavigationSharedPreferences.upDateShatedPreferences();

        //   //       if (kIsWeb) {
        //   //         html.window.history.back();
        //   //         context.router.pop();
        //   //       } else {
        //   //         context.router.pop();
        //   //       }
        //   //     },
        //   //     iconSize: HW.getHeight(37, context),
        //   //     icon: const Icon(
        //   //       Icons.arrow_upward_sharp,
        //   //       color: AppColors.white,
        //   //     )),
        //   icons: isSoundOn ? AssetsPath.iconVolumeOn : AssetsPath.iconVolumeOff,
        //   onTapVolume: isSoundOn
        //       ? () {
        //           setState(() {
        //             isSoundOn = !isSoundOn;
        //             backgroundplayer.pause();
        //           });
        //         }
        //       : () {
        //           setState(() {
        //             isSoundOn = !isSoundOn;
        //             backgroundplayer.play();
        //           });
        //         },
        //   onTapMenu: () {
        //     Scaffold.of(context).openEndDrawer();
        //   },
        // ),

        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(
              top: HW.getHeight(115, context),
            ),
            color: AppColors.black06,
            width: HW.getWidth(647, context),
            padding: EdgeInsets.symmetric(
              vertical: HW.getWidth(40, context),
              horizontal: HW.getWidth(40, context),
            ),
            child: Text(
              locals.medicineText,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  height: 1.7,
                  fontFamily: "Lora",
                  color: AppColors.white,
                  fontSize: TextFontSize.getHeight(16, context)),
            ),
          ),
        ),
      ],
    );
  }
}
