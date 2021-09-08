import 'package:flutter/material.dart';

import '../utils/styles.dart';
import 'animated_widgets/pulsing_widget.dart';

class LoadingWidget extends StatefulWidget {
  String? loadingCound;
  LoadingWidget({
    Key? key,
    this.loadingCound,
  }) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PulsingWidget(
              duration: Times.medium,
              tween: Tween(end: 0.25, begin: 1.5),
              child: const Text(
                "Loading...",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Text(
              '${widget.loadingCound}%',
              style: const TextStyle(fontSize: 30, color: Colors.white),
            )
          ],
        ),
      ),
    ));
  }
}
