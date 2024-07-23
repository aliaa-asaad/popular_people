// Mocks generated by Mockito 5.4.4 from annotations
// in popular_people/test/features/popular_people/presentation/view_model/cubit/popular_people_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:popular_people/core/handlers/error_handler/failure.dart' as _i5;
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart'
    as _i6;
import 'package:popular_people/features/popular_people/data/repo/popular_people_repo.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PopularPeopleRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularPeopleRepo extends _i1.Mock implements _i3.PopularPeopleRepo {
  MockPopularPeopleRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.PopularPeopleModel>> getPopularPeople(
          {required Map<String, dynamic>? query}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularPeople,
          [],
          {#query: query},
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.PopularPeopleModel>>.value(
                _FakeEither_0<_i5.Failure, _i6.PopularPeopleModel>(
          this,
          Invocation.method(
            #getPopularPeople,
            [],
            {#query: query},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.PopularPeopleModel>>);
}