import 'package:flutter_app/data/models/joke.dart';
import 'package:flutter_app/data/repositories/joke_repository.dart';

class GetJokeUseCase {
  final JokeRepository jokeRepository;

  GetJokeUseCase(this.jokeRepository);

  Future<Joke> call() async {
    return await jokeRepository.getJoke();
  }
}
