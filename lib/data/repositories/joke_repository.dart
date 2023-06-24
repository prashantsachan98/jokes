import 'package:flutter_app/data/data_providers/joke_api_provider.dart';
import 'package:flutter_app/data/models/joke.dart';

class JokeRepository {
  final JokeApiProvider jokeApiProvider;

  JokeRepository(this.jokeApiProvider);

  Future<Joke> getJoke() async {
    return await jokeApiProvider.getJoke();
  }
}
