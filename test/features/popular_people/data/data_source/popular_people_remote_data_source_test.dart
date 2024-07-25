import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:popular_people/core/config/end_points.dart';
import 'package:popular_people/core/network/web_services.dart';
import 'package:popular_people/features/popular_people/data/data_source/popular_people_remote_data_source.dart';
import 'package:popular_people/features/popular_people/data/models/images_model.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';

import 'popular_people_remote_data_source_test.mocks.dart';

@GenerateMocks([Network])
void main() {
  late final Network mockNetwork;
  late final PopularPeopleRemoteDataSource popularPeopleRemoteDataSource;
  setUp(() => {
        mockNetwork = MockNetwork(),
        popularPeopleRemoteDataSource =
            PopularPeopleRemoteDataSourceImpl(network: mockNetwork)
      });

  /* MissingStubError: 'get'
No stub was found which matches the arguments of this method call: */
  test('get the popular people data if the status code is 200', () async {
    //arrange
    final query = {'pages': 1, 'language': 'en-US'};
    final expectedData = PopularPeopleModel(
        page: 1,
        results: [
          Results(id: 1, knownForDepartment: '', name: '', profilePath: '')
        ],
        totalPages: 1,
        totalResults: 1);
    final Map<String, dynamic> popularPeopleData =
        PopularPeopleModel().toJson();

    when(mockNetwork.get(
            url: ApiEndPoints.baseUrl + ApiEndPoints.popularPeople,
            query: query))
        .thenAnswer(
      (_) async => Future.value(
        Response(
            requestOptions: RequestOptions(
                path: ApiEndPoints.baseUrl + ApiEndPoints.popularPeople,
                queryParameters: query),
            data: popularPeopleData,
            statusCode: 200),
      ),
    );

    //act
    final result = await popularPeopleRemoteDataSource
        .get({'pages': 1, 'language': 'en-US'});
    //assert
    expect(result, expectedData);
  });

  test('get the popular people images if the status code is 200', () async {
    //arrange

    final expectedData =
        Images(baseUrl: '', profileSizes: [], secureBaseUrl: '');
    final Map<String, dynamic> popularPeopleImages = Images().toJson();

    when(mockNetwork.get(
      url: ApiEndPoints.baseUrl + ApiEndPoints.images,
    )).thenAnswer(
      (_) async => Future.value(
        Response(
            requestOptions: RequestOptions(
              path: ApiEndPoints.baseUrl + ApiEndPoints.images,
            ),
            data: popularPeopleImages,
            statusCode: 200),
      ),
    );

    //act
    final result = await popularPeopleRemoteDataSource.getImages();
    //assert
    expect(result, expectedData);
  });
}
