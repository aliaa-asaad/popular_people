// Mocks generated by Mockito 5.4.4 from annotations
// in popular_people/test/features/person_details/data/repo/person_details_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:popular_people/core/network/network_info.dart' as _i8;
import 'package:popular_people/features/person_details/data/data_source/person_details_local_data_source.dart'
    as _i4;
import 'package:popular_people/features/person_details/data/data_source/person_details_remote_data_source.dart'
    as _i7;
import 'package:popular_people/features/person_details/data/models/pereson_images_model.dart'
    as _i6;
import 'package:popular_people/features/person_details/data/models/person_details_model.dart'
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

class _FakePersonDetailsModel_0 extends _i1.SmartFake
    implements _i2.PersonDetailsModel {
  _FakePersonDetailsModel_0(
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

/// A class which mocks [PersonDetailsLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPersonDetailsLocalDataSource extends _i1.Mock
    implements _i4.PersonDetailsLocalDataSource {
  MockPersonDetailsLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.PersonDetailsModel> getCachedPersonDetails() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedPersonDetails,
          [],
        ),
        returnValue:
            _i5.Future<_i2.PersonDetailsModel>.value(_FakePersonDetailsModel_0(
          this,
          Invocation.method(
            #getCachedPersonDetails,
            [],
          ),
        )),
      ) as _i5.Future<_i2.PersonDetailsModel>);

  @override
  _i5.Future<List<_i6.Profiles>> getCachedPersonImages() => (super.noSuchMethod(
        Invocation.method(
          #getCachedPersonImages,
          [],
        ),
        returnValue: _i5.Future<List<_i6.Profiles>>.value(<_i6.Profiles>[]),
      ) as _i5.Future<List<_i6.Profiles>>);

  @override
  _i5.Future<_i3.Unit> cachePersonDetails(
          _i2.PersonDetailsModel? personDetailsModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #cachePersonDetails,
          [personDetailsModel],
        ),
        returnValue: _i5.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #cachePersonDetails,
            [personDetailsModel],
          ),
        )),
      ) as _i5.Future<_i3.Unit>);
}

/// A class which mocks [PersonDetailsRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPersonDetailsRemoteDataSource extends _i1.Mock
    implements _i7.PersonDetailsRemoteDataSource {
  MockPersonDetailsRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.PersonDetailsModel> getPersonDetails({required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPersonDetails,
          [],
          {#id: id},
        ),
        returnValue:
            _i5.Future<_i2.PersonDetailsModel>.value(_FakePersonDetailsModel_0(
          this,
          Invocation.method(
            #getPersonDetails,
            [],
            {#id: id},
          ),
        )),
      ) as _i5.Future<_i2.PersonDetailsModel>);

  @override
  _i5.Future<List<_i6.Profiles>> getPersonImages({required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPersonImages,
          [],
          {#id: id},
        ),
        returnValue: _i5.Future<List<_i6.Profiles>>.value(<_i6.Profiles>[]),
      ) as _i5.Future<List<_i6.Profiles>>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i8.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
