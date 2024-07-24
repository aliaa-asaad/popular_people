import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';
import 'package:popular_people/features/popular_people/data/repo/popular_people_repo.dart';
import 'package:popular_people/features/popular_people/presentation/view_model/cubit/popular_people_cubit.dart';

import 'popular_people_cubit_test.mocks.dart';

@GenerateMocks([PopularPeopleRepo])
void main() {
  late final PopularPeopleCubit popularPeopleCubit;
  late final PopularPeopleRepo mockedPopularPeopleRepo;
  setUp(() => {
        mockedPopularPeopleRepo = MockPopularPeopleRepo(),
        popularPeopleCubit =
            PopularPeopleCubit(popularPeopleRepo: mockedPopularPeopleRepo),
      });

  //success:The test run did not record any output.
  test('initial state should be PopularPeopleInitial', () {
    //arrange
    final popularPeopleData = PopularPeopleModel(
        page: 1, results: [], totalPages: 1, totalResults: 1);

    when(mockedPopularPeopleRepo
            .getPopularPeople(query: {'pages': 1, 'language': 'en-US'}))
        .thenAnswer((_) async => Future.value(Right(popularPeopleData)));

    //assert
    final expectedState = [
      PopularPeopleLoading(),
      PopularPeopleLoaded(popularPeopleData: popularPeopleData.results!)
    ];
    expectLater(popularPeopleCubit.stream, emitsInOrder(expectedState));
    //act
    popularPeopleCubit.getPopularPeople();

    // expect(popularPeopleCubit.state, popularPeopleState);
  });
}
