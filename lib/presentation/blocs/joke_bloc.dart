import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/data/models/joke.dart';
import 'package:flutter_app/domain/usecases/get_joke_usecase.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final GetJokeUseCase getJokeUseCase;

  JokeBloc(this.getJokeUseCase) : super(JokeInitial()) {
    on<JokeRequested>((event, emit) async {
      emit(JokeLoading());
      try {
        final joke = await getJokeUseCase();
        emit(JokeLoaded(joke));
      } catch (_) {
        emit(JokeError('Failed to fetch joke'));
      }
    });
  }
}

abstract class JokeEvent extends Equatable {}

class JokeRequested extends JokeEvent {
  @override
  List<Object> get props => [];
}

abstract class JokeState extends Equatable {}

class JokeInitial extends JokeState {
  @override
  List<Object> get props => [];
}

class JokeLoading extends JokeState {
  @override
  List<Object> get props => [];
}

class JokeLoaded extends JokeState {
  final Joke joke;

  JokeLoaded(this.joke);

  @override
  List<Object> get props => [joke];
}

class JokeError extends JokeState {
  final String message;

  JokeError(this.message);

  @override
  List<Object> get props => [message];
}
