import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial());

  @override
  Stream<CharacterState> mapEventToState(
    CharacterEvent event,
  ) async* {
    if (event is GetInfoCharacter) {
      //yield CharacterPressed();
    }
  }
}
