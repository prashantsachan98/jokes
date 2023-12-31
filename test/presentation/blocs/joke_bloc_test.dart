import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/data/models/joke.dart';
import 'package:flutter_app/domain/usecases/get_joke_usecase.dart';
import 'package:flutter_app/presentation/blocs/joke_bloc.dart';
import 'package:flutter_app/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'joke_bloc_test.mocks.dart';

@GenerateMocks([GetJokeUseCase])
void main() {
  group('JokeBloc', () {
    final joke = Joke(
      id: '1',
      status: 'Success',
      content: 'Why don\'t scientists trust atoms? Because they make up everything.',
      jokeNo: 1,
      createdBy: 'Amit Sharma',
    );
    final mockGetJokeUseCase = MockGetJokeUseCase();

    setUpAll(() {
      serviceLocator.registerSingleton<GetJokeUseCase>(mockGetJokeUseCase);
    });

    tearDownAll(() {
      serviceLocator.reset();
    });

    blocTest<JokeBloc, JokeState>(
      'emits [JokeLoading, JokeLoaded] when JokeRequested is added',
      build: () {
        when(mockGetJokeUseCase.call()).thenAnswer((_) async => joke);
        return JokeBloc();
      },
      act: (bloc) => bloc.add(JokeRequested()),
      expect: () => [JokeLoading(), JokeLoaded(joke)],
    );

    blocTest<JokeBloc, JokeState>(
      'emits [JokeLoading, JokeError] when GetJokeUseCase throws an exception',
      build: () {
        when(mockGetJokeUseCase.call()).thenThrow(Exception('Failed to fetch joke'));
        return JokeBloc();
      },
      act: (bloc) => bloc.add(JokeRequested()),
      expect: () => [JokeLoading(), JokeError('Failed to fetch joke')],
    );
  });
}
