import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'data/data_providers/joke_api_provider.dart';
import 'data/repositories/joke_repository.dart';
import 'domain/usecases/get_joke_usecase.dart';

final GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => JokeApiProvider(serviceLocator()));
  serviceLocator.registerLazySingleton(() => JokeRepository(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetJokeUseCase(serviceLocator()));
}
