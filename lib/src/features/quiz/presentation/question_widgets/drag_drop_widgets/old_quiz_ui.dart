// return LayoutBuilder(builder: (context, constraints) {
//       return MouseRegion(
//         onHover: (e) {
//           setState(() {
//             final position = Offset(
//                 e.position.dx + _horizontalController.offset,
//                 e.position.dy + _verticalController.offset);
//             mousePosition = position;
//           });
//         },
//         child: SingleChildScrollView(
//           controller: _verticalController,
//           scrollDirection: Axis.vertical,
//           child: Container(
//             alignment: Alignment.centerLeft,
//             width: ui.window.physicalSize.width,
//             height: 1000,
//             child: SingleChildScrollView(
//               controller: _horizontalController,
//               scrollDirection: Axis.horizontal,
//               child: Container(
//                 width: 1300,
//                 height: 1000,
//                 child: Stack(
//                   children: [
//                     ...widget.userAnswer
//                         .map((customPaint) => customPaint.customPaint),
//                     if (QuizData.showRightAnswers)
//                       ...widget.listCorrectrAnswers
//                           .map((customPaint) => customPaint.customPaint),
//                     if (QuizData.showRightAnswers)
//                       ...widget.userAnswerWithCheck
//                           .map((customPaint) => customPaint.customPaint),
//                     CustomPaint(
//                       painter: DrowLine(
//                         color: AppColors.grey,
//                         strat: drowingLineStartOffset,
//                         end: drowingLineEndOffset,
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: AbsorbPointer(
//                         absorbing: QuizData.showRightAnswers,
//                         child: Container(
//                           height: 1000,
//                           margin: const EdgeInsets.only(
//                               top: 120, left: 20, right: 20),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                   padding: const EdgeInsets.only(right: 50),
//                                   child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                             flex: 5,
//                                             child: Text(widget.question,
//                                                 maxLines: 2,
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .subtitle1
//                                                     ?.copyWith(
//                                                       fontSize: TextFontSize
//                                                           .getHeight(
//                                                               24, context),
//                                                     ))),
//                                       ])),
//                               Row(
//                                 children: <Widget>[
//                                   Container(
//                                     width: 700,
//                                     child: Column(children: [
//                                       ...widget.answers
//                                           .map(
//                                             (answer) => Container(
//                                               width: 700,
//                                               child: Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.center,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 children: [
//                                                   Container(
//                                                       alignment:
//                                                           Alignment.centerLeft,
//                                                       width: 500,
//                                                       height:
//                                                           widget.quizWithImage
//                                                               ? 110
//                                                               : 50,
//                                                       child: Text(answer.text)),
//                                                   Container(
//                                                     key: answer.globalKey,
//                                                     alignment:
//                                                         Alignment.centerLeft,
//                                                     height: 50,
//                                                     width: 150,
//                                                     child: CircleWidget(
//                                                       isDraging: true,
//                                                       onDragCompleted: () {
//                                                         print(
//                                                             'onDragCompleted');
//                                                         setState(() {
//                                                           drowingLineEndOffset =
//                                                               Offset.zero;
//                                                           drowingLineStartOffset =
//                                                               Offset.zero;
//                                                         });
//                                                         addUserAnswers(
//                                                             answer.value,
//                                                             targetValue);
//                                                         addUserAnswersWithCheck(
//                                                             answer.value,
//                                                             targetValue);
//                                                       },
//                                                       targetIsImage: false,
//                                                       getStartLineOffset:
//                                                           (mousePosition) {
//                                                         drowingLineStartOffset =
//                                                             mousePosition;

//                                                         lineOffsetStart =
//                                                             mousePosition;
//                                                       },
//                                                       getEndLineOffset:
//                                                           (mousePosition) {
//                                                         setState(() {
//                                                           lineOffsetEnd = mousePosition +
//                                                               Offset(
//                                                                   _horizontalController
//                                                                       .offset,
//                                                                   _verticalController
//                                                                       .offset);

//                                                           drowingLineEndOffset =
//                                                               mousePosition +
//                                                                   Offset(
//                                                                       _horizontalController
//                                                                           .offset,
//                                                                       _verticalController
//                                                                           .offset);
//                                                         });
//                                                       },
//                                                       onWillAccept: false,
//                                                       onMove: (data) {
//                                                         setState(() {
//                                                           var withScroolOfset = data
//                                                                   .offset +
//                                                               Offset(
//                                                                   _horizontalController
//                                                                       .offset,
//                                                                   _verticalController
//                                                                       .offset);
//                                                           lineOffsetEnd =
//                                                               withScroolOfset;

//                                                           drowingLineEndOffset =
//                                                               withScroolOfset;
//                                                         });
//                                                       },
//                                                       context: context,
//                                                       answers: [answer],
//                                                       onAccept: (data) {
//                                                         print('onAccept');
//                                                         print(data.value);
//                                                       },
//                                                       onDragEnd: () {
//                                                         drowingLineEndOffset =
//                                                             Offset.zero;
//                                                         drowingLineStartOffset =
//                                                             Offset.zero;
//                                                         // print(
//                                                         //     drowingLineEndOffset);
//                                                         // print(
//                                                         //     drowingLineStartOffset);
//                                                       },
//                                                       mouseOffset:
//                                                           mousePosition,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           )
//                                           .toList(),
//                                     ]),
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                       width: 400,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: <Widget>[
//                                           ...widget.variants
//                                               .map(
//                                                 (variant) => Container(
//                                                   width: 700,
//                                                   child: Row(
//                                                     children: [
//                                                       Container(
//                                                         key: variant.globalKey,
//                                                         alignment: Alignment
//                                                             .centerLeft,
//                                                         height: 50,
//                                                         width: 50,
//                                                         child: CircleWidget(
//                                                           targetIsImage: widget
//                                                               .quizWithImage,
//                                                           onWillAccept: true,
//                                                           onMove: (data) {
//                                                             setState(() {
//                                                               // lineOffsetEnd = data.offset;
//                                                               //  print(data.offset);
//                                                             });
//                                                           },
//                                                           isDraging: false,
//                                                           correctAnswers: [
//                                                             variant
//                                                                 .correctAnswers!
//                                                           ],
//                                                           context: context,
//                                                           answers: [variant],
//                                                           onAccept: (data) {
//                                                             if (variant
//                                                                     .correctAnswers! ==
//                                                                 data.correctAnswers) {
//                                                               QuizData.valueForDrowColoredLineFor =
//                                                                   true;
//                                                               targetValue =
//                                                                   variant.value;
//                                                               print(
//                                                                   'It is write :::TargetValue $targetValue');
//                                                             } else {
//                                                               QuizData.valueForDrowColoredLineFor =
//                                                                   false;
//                                                               targetValue =
//                                                                   variant.value;

//                                                               print(
//                                                                   'It is  wrong :::TargetValue $targetValue');
//                                                             }
//                                                           },
//                                                           mouseOffset:
//                                                               mousePosition,
//                                                         ),
//                                                       ),
//                                                       if (widget.quizWithImage)
//                                                         Clickable(
//                                                           onPressed: () {
//                                                             showDialog(
//                                                                 context:
//                                                                     context,
//                                                                 builder:
//                                                                     (context) {
//                                                                   return DialoigMapImage(
//                                                                     image: variant
//                                                                         .text,
//                                                                   );
//                                                                 });
//                                                           },
//                                                           child: Container(
//                                                               padding:
//                                                                   const EdgeInsets
//                                                                           .only(
//                                                                       bottom:
//                                                                           8),
//                                                               width: 200,
//                                                               height: 110,
//                                                               child:
//                                                                   Image.asset(
//                                                                 variant.text,
//                                                                 fit: BoxFit
//                                                                     .cover,
//                                                               )),
//                                                         )
//                                                       else
//                                                         Flexible(
//                                                           child: Container(
//                                                               alignment: Alignment
//                                                                   .centerLeft,
//                                                               height: 50,
//                                                               child: Text(
//                                                                 "  ${variant.text}",
//                                                                 maxLines: 2,
//                                                               )),
//                                                         ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               )
//                                               .toList(),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     });