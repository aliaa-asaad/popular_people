// Mocks generated by Mockito 5.4.4 from annotations
// in popular_people/test/features/popular_people/data/repo/popular_people_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:popular_people/core/network/network_info.dart' as _i8;
import 'package:popular_people/features/popular_people/data/data_source/popular_people_local_data_source.dart'
    as _i5;
import 'package:popular_people/features/popular_people/data/data_source/popular_people_remote_data_source.dart'
    as _i7;
import 'package:popular_people/features/popular_people/data/models/images_model.dart'
    as _i4;
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart'
    as _i2;

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

class _FakePopularPeopleModel_0 extends _i1.SmartFake
    implements _i2.PopularPeopleModel {
  _FakePopularPeopleModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUnit_1 extends _i1.SmartFake implements _i3.Unit {
  _FakeUnit_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeImages_2 extends _i1.SmartFake implements _i4.Images {
  _FakeImages_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PopularPeopleLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularPeopleLocalDataSource extends _i1.Mock
    implements _i5.PopularPeopleLocalDataSource {
  MockPopularPeopleLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.PopularPeopleModel> getCachedPopularPeople() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedPopularPeople,
          [],
        ),
        returnValue:
            _i6.Future<_i2.PopularPeopleModel>.value(_FakePopularPeopleModel_0(
          this,
          Invocation.method(
            #getCachedPopularPeople,
            [],
          ),
        )),
      ) as _i6.Future<_i2.PopularPeopleModel>);

  @override
  _i6.Future<_i3.Unit> cachePopularPeople(
          _i2.PopularPeopleModel? popularPeopleModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #cachePopularPeople,
          [popularPeopleModel],
        ),
        returnValue: _i6.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #cachePopularPeople,
            [popularPeopleModel],
          ),
        )),
      ) as _i6.Future<_i3.Unit>);
}

/// A class which mocks [PopularPeopleRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularPeopleRemoteDataSource extends _i1.Mock
    implements _i7.PopularPeopleRemoteDataSource {
  MockPopularPeopleRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.PopularPeopleModel> get(Map<String, dynamic>? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [query],
        ),
        returnValue:
            _i6.Future<_i2.PopularPeopleModel>.value(_FakePopularPeopleModel_0(
          this,
          Invocation.method(
            #get,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.PopularPeopleModel>);

  @override
  _i6.Future<_i4.Images> getImages() => (super.noSuchMethod(
        Invocation.method(
          #getImages,
          [],
        ),
        returnValue: _i6.Future<_i4.Images>.value(_FakeImages_2(
          this,
          Invocation.method(
            #getImages,
            [],
          ),
        )),
      ) as _i6.Future<_i4.Images>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i8.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}
