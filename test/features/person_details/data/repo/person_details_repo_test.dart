import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:popular_people/core/network/network_info.dart';
import 'package:popular_people/features/person_details/data/data_source/person_details_local_data_source.dart';
import 'package:popular_people/features/person_details/data/data_source/person_details_remote_data_source.dart';
import 'package:popular_people/features/person_details/data/models/pereson_images_model.dart';
import 'package:popular_people/features/person_details/data/models/person_details_model.dart';
import 'package:popular_people/features/person_details/data/repo/person_details_repo.dart';

import 'person_details_repo_test.mocks.dart';

@GenerateMocks(
    [PersonDetailsLocalDataSource, PersonDetailsRemoteDataSource, NetworkInfo])
void main() {
  late PersonDetailsRepo personDetailsRepo;
  late PersonDetailsLocalDataSource mockedPersonDetailsLocalDataSource;
  late PersonDetailsRemoteDataSource mockedPersonDetailsRemoteDataSource;
  late NetworkInfo mockedNetworkInfo;
  setUp(() {
    mockedPersonDetailsLocalDataSource = MockPersonDetailsLocalDataSource();
    mockedPersonDetailsRemoteDataSource = MockPersonDetailsRemoteDataSource();
    mockedNetworkInfo = MockNetworkInfo();
    personDetailsRepo = PersonDetailsRepoImpl(
        localDataSource: mockedPersonDetailsLocalDataSource,
        remoteDataSource: mockedPersonDetailsRemoteDataSource,
        networkInfo: mockedNetworkInfo);
  });

  //success: The test run did not record any output.
  test('get remote details data from the repo', () async {
    //arrange
    final data = PersonDetailsModel(
        biography: '',
        birthday: '',
        id: 1696016,
        name: '',
        profilePath: '',
        knownForDepartment: '');
    when(mockedNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(mockedPersonDetailsRemoteDataSource.getPersonDetails(id: 1696016))
        .thenAnswer((_) async => data);
    //act
    final result = await personDetailsRepo.getPersonDetails(id: 1696016);

    //assert
    expect(result, Right(data));
  });
  
//success: The test run did not record any output.
  test('get remote images data from the repo', () async {
    //arrange
    final expectedData = List.generate(5, (index) => Profiles(filePath: ''));

    when(mockedNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(mockedPersonDetailsRemoteDataSource.getPersonImages(id: 1696016))
        .thenAnswer((_) async => expectedData);
    //act
    final result = await personDetailsRepo.getPersonImages(id: 1696016);

    //assert
    expect(result, Right(expectedData));
  });
}
