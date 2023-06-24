import 'package:flutter_app/data/data_providers/joke_api_provider.dart';
import 'package:flutter_app/data/models/joke.dart';
import 'package:flutter_app/service_locator.dart';

class JokeRepository {
  final JokeApiProvider jokeApiProvider = serviceLocator<JokeApiProvider>();

  Future<Joke> getJoke() async {
    return await jokeApiProvider.getJoke();
  }
}
