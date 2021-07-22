import 'package:flutter/material.dart';

import 'animated_widgets/pulsing_widget.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

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
        child: PulsingWidget(
          duration: const Duration(milliseconds: 500),
          tween: Tween(end: 0.25, begin: 1.5),
          child: const Text(
            "Loading...",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    ));
  }
}
