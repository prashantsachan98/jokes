import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'data/data_providers/joke_api_provider.dart';
import 'data/repositories/joke_repository.dart';
import 'domain/usecases/get_joke_usecase.dart';
import 'presentation/blocs/joke_bloc.dart';
import 'presentation/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) {
          final jokeApiProvider = JokeApiProvider(http.Client());
          final jokeRepository = JokeRepository(jokeApiProvider);
          final getJokeUseCase = GetJokeUseCase(jokeRepository);
          return JokeBloc(getJokeUseCase);
        },
        child: HomePage(title: 'Flutter Jokes'),
      ),
    );
  }
}
