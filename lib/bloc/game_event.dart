part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends GameEvent {
  @override
  List<Object> get props => [];
}

class SkipEvent extends GameEvent {
  final bool skipped = true;
  @override
  List<Object> get props => [skipped];
}

class GotItEvent extends GameEvent {
  final bool result = true;
  @override
  List<Object> get props => [result];
}

class EndEvent extends GameEvent {
  @override
  List<Object> get props => [];
}
