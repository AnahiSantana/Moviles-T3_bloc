part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameInitial extends GameState {}

class StartedGameState extends GameState {
  final String title;
  final String word;
  final int count;

  StartedGameState(
      {@required this.title, @required this.word, @required this.count});

  @override
  List<Object> get props => [title, word, count];
}

class EndedGameState extends GameState {
  final String title;
  final int count;

  EndedGameState({@required this.title, @required this.count});

  @override
  List<Object> get props => [title, count];
}
