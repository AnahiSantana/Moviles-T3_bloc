import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitial());

  List<String> words1 = ["grape", "lazy", "dog", "cat"];
  List<String> words2 = ["grape", "lazy", "dog", "cat"];
  int score = 0;
  int index = 0;

  @override
  Stream<GameState> mapEventToState(
    GameEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is StartEvent) {
      score = 0;
      index = 0;
      words2.shuffle();
      words1.shuffle();
      print(words2);
      print(words1);
      yield StartedGameState(
          count: score, word: words1[index], title: "The word is ...");
    } else if (event is SkipEvent) {
      if (index < words1.length - 1) {
        index++;
        yield StartedGameState(
            count: score, word: words1[index], title: "The word is ...");
      } else {
        yield EndedGameState(count: score, title: "Final score");
      }
    } else if (event is GotItEvent) {
      if (words1[index] == words2[index]) score++;
      if (index < words1.length - 1) {
        index++;
        yield StartedGameState(
            count: score, word: words1[index], title: "The word is ...");
      } else {
        yield EndedGameState(count: score, title: "Final score");
      }
    } else if (event is EndEvent) {
      yield EndedGameState(count: score, title: "Final score");
    }
  }
}
