import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/presentation/blocs/joke_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<JokeBloc, JokeState>(
        builder: (context, state) {
          if (state is JokeInitial) {
            return Center(child: Text('Press the button to fetch a joke'));
          } else if (state is JokeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is JokeLoaded) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(34.0),
              child: Text(
                '${state.joke.content}',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ));
          } else if (state is JokeError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<JokeBloc>().add(JokeRequested()),
        tooltip: 'Fetch Joke',
        child: Icon(Icons.mood),
      ),
    );
  }
}
