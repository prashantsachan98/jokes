// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_app/test/presentation/blocs/joke_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter_app/data/models/joke.dart' as _i3;
import 'package:flutter_app/data/repositories/joke_repository.dart' as _i2;
import 'package:flutter_app/domain/usecases/get_joke_usecase.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeJokeRepository_0 extends _i1.SmartFake
    implements _i2.JokeRepository {
  _FakeJokeRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeJoke_1 extends _i1.SmartFake implements _i3.Joke {
  _FakeJoke_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetJokeUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetJokeUseCase extends _i1.Mock implements _i4.GetJokeUseCase {
  MockGetJokeUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.JokeRepository get jokeRepository => (super.noSuchMethod(
        Invocation.getter(#jokeRepository),
        returnValue: _FakeJokeRepository_0(
          this,
          Invocation.getter(#jokeRepository),
        ),
      ) as _i2.JokeRepository);
  @override
  _i5.Future<_i3.Joke> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i5.Future<_i3.Joke>.value(_FakeJoke_1(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Joke>);
}
