import 'package:flutter_app/data/models/joke.dart';
import 'package:flutter_app/data/repositories/joke_repository.dart';
import 'package:flutter_app/service_locator.dart';

class GetJokeUseCase {
  final JokeRepository jokeRepository = serviceLocator<JokeRepository>();

  Future<Joke> call() async {
    return await jokeRepository.getJoke();
  }
}
