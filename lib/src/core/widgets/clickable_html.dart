import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

class ClickableHtml extends StatefulWidget {
  final Function onTap;
  final String view;
  final double width;
  final double height;

  const ClickableHtml({
    Key? key,
    required this.onTap,
    required this.view,
    this.width = 200,
    this.height = 200,
  }) : super(key: key);

  @override
  _ClickableHtmlState createState() => _ClickableHtmlState();
}

class _ClickableHtmlState extends State<ClickableHtml> {
  @override
  void initState() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        widget.view,
        (int viewId) => html.ImageElement()
          ..width = widget.width.toInt()
          ..height = widget.height.toInt()
          ..src = widget.view
          ..style.border = 'none');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: IgnorePointer(child: HtmlElementView(viewType: widget.view)),
      ),
    );
  }
}
