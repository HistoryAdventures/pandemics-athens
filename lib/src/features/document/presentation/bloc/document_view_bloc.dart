import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_view_bloc.freezed.dart';
part 'document_view_event.dart';
part 'document_view_state.dart';

class DocumentViewBloc extends Bloc<DocumentViewEvent, DocumentViewState> {
  final TransformationController controller;
  DocumentViewBloc(this.controller) : super(const Initial());

  @override
  Stream<DocumentViewState> mapEventToState(
    DocumentViewEvent event,
  ) async* {
    yield* event.map(
      zoomIn: (e) async* {
   
      },
      zoomOut: (e) async* {},
    );
  }
}
