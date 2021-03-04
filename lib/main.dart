import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_word/bloc/game_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 3',
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.green,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Guess the word'),
          ),
          body: BlocProvider(
            create: (context) => GameBloc(),
            child: BlocConsumer<GameBloc, GameState>(
              listener: (context, state) {
                //TODO
              },
              builder: (context, state) {
                if (state is StartedGameState) {
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(flex: 5),
                          Text(
                            state.title,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(flex: 1),
                          Text(
                            state.word,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Spacer(flex: 3),
                          Text(state.count.toString()),
                          Spacer(flex: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MaterialButton(
                                color: Colors.grey[100],
                                child: Text("SKIP"),
                                onPressed: () {
                                  BlocProvider.of<GameBloc>(context)
                                      .add(SkipEvent());
                                },
                              ),
                              MaterialButton(
                                color: Colors.lightGreenAccent[400],
                                child: Text(
                                  "GOT IT",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  BlocProvider.of<GameBloc>(context)
                                      .add(GotItEvent());
                                },
                              ),
                              MaterialButton(
                                color: Colors.grey[100],
                                child: Text("END GAME"),
                                onPressed: () {
                                  BlocProvider.of<GameBloc>(context)
                                      .add(EndEvent());
                                },
                              ),
                            ],
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  );
                } else if (state is EndedGameState) {
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(flex: 5),
                          Text(
                            state.title,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(flex: 1),
                          Text(
                            state.count.toString(),
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Spacer(flex: 4),
                          MaterialButton(
                            color: Colors.lightGreenAccent[400],
                            child: Text(
                              "PLAY AGAIN",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<GameBloc>(context)
                                  .add(StartEvent());
                            },
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  );
                } else
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(flex: 5),
                          Text(
                            "Get ready to",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(flex: 1),
                          Text(
                            "guess the word!!",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Spacer(flex: 4),
                          MaterialButton(
                            color: Colors.lightGreenAccent[400],
                            child: Text(
                              "PLAY",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<GameBloc>(context)
                                  .add(StartEvent());
                            },
                          ),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                  );
              },
            ),
          )),
    );
  }
}
