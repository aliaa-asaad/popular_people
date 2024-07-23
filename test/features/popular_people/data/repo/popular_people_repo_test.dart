import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:popular_people/core/network/network_info.dart';
import 'package:popular_people/features/popular_people/data/data_source/popular_people_local_data_source.dart';
import 'package:popular_people/features/popular_people/data/data_source/popular_people_remote_data_source.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';
import 'package:popular_people/features/popular_people/data/repo/popular_people_repo.dart';

import 'popular_people_repo_test.mocks.dart';

@GenerateMocks(
    [PopularPeopleLocalDataSource, PopularPeopleRemoteDataSource, NetworkInfo])
void main() {
  late PopularPeopleRepo popularPeopleRepo;
  late PopularPeopleLocalDataSource mockedPopularPeopleLocalDataSource;
  late PopularPeopleRemoteDataSource mockedPopularPeopleRemoteDataSource;
  late NetworkInfo mockedNetworkInfo;
  setUp(() {
    mockedPopularPeopleLocalDataSource = MockPopularPeopleLocalDataSource();
    mockedPopularPeopleRemoteDataSource = MockPopularPeopleRemoteDataSource();
    mockedNetworkInfo = MockNetworkInfo();
    popularPeopleRepo = PopularPeopleRepoImpl(
        localDataSource: mockedPopularPeopleLocalDataSource,
        remoteDataSource: mockedPopularPeopleRemoteDataSource,
        networkInfo: mockedNetworkInfo);
  });

  //success: The test run did not record any output.
  test('get remote data from the repo', () async {
    //arrange
    final data = PopularPeopleModel(
        page: 1, results: [], totalPages: 1, totalResults: 1);
    when(mockedNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(mockedPopularPeopleRemoteDataSource
            .get({'pages': 1, 'language': 'en-US'}))
        .thenAnswer((_) async => data);
    //act
    final result = await popularPeopleRepo
        .getPopularPeople(query: {'pages': 1, 'language': 'en-US'});
    //assert
    expect(result, Right(data));
  });
}
