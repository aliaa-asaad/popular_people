import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:popular_people/core/config/end_points.dart';
import 'package:popular_people/core/network/web_services.dart';
import 'package:popular_people/features/person_details/data/data_source/person_details_remote_data_source.dart';
import 'package:popular_people/features/person_details/data/models/pereson_images_model.dart';
import 'package:popular_people/features/person_details/data/models/person_details_model.dart';

import 'person_details_remote_data_source_test.mocks.dart';

@GenerateMocks([Network])
void main() {
  late final Network mockNetwork;
  late final PersonDetailsRemoteDataSource personDetailsRemoteDataSource;

  setUp(() => {
        mockNetwork = MockNetwork(),
        personDetailsRemoteDataSource =
            PersonDetailsRemoteDataSourceImpl(network: mockNetwork)
      });

  //failure:No stub was found which matches the arguments of this method call:
//get({url: person/1696016, query: null, headers: null, withToken: true})
  test('get the person deatils data if the status code is 200', () async {
    //arrange

    final expectedData = PersonDetailsModel(
        biography: '',
        birthday: '',
        id: 1696016,
        name: '',
        profilePath: '',
        knownForDepartment: '');

    final Map<String, dynamic> personDetailsData =
        PersonDetailsModel().toJson();

    when(mockNetwork.get(
      url: '${ApiEndPoints.baseUrl}${ApiEndPoints.personDetails}1696016',
    )).thenAnswer(
      (_) async => Future.value(
        Response(
            requestOptions: RequestOptions(
              path:
                  '${ApiEndPoints.baseUrl}${ApiEndPoints.personDetails}1696016',
            ),
            data: personDetailsData,
            statusCode: 200),
      ),
    );

    //act
    final result =
        await personDetailsRemoteDataSource.getPersonDetails(id: 1696016);
    //assert
    expect(result, expectedData);
  });

/*failure: No stub was found which matches the arguments of this method call:
get({url: person/1696016/images, query: null, headers: null, withToken: true}) */
  test('get the person images data if the status code is 200', () async {
    //arrange

    final expectedData = List.generate(5, (index) => Profiles(filePath: ''));

    final List<Map<String, dynamic>> personImages =
        expectedData.map((images) => images.toJson()).toList();

    when(mockNetwork.get(
      url:
          '${ApiEndPoints.baseUrl}${ApiEndPoints.personDetails}1696016${ApiEndPoints.personImages}',
    )).thenAnswer(
      (_) async => Future.value(
        Response(
            requestOptions: RequestOptions(
              path:
                  '${ApiEndPoints.baseUrl}${ApiEndPoints.personDetails}1696016${ApiEndPoints.personImages}',
            ),
            data: personImages,
            statusCode: 200),
      ),
    );

    //act
    final result =
        await personDetailsRemoteDataSource.getPersonImages(id: 1696016);
    //assert
    expect(result, expectedData);
  });
}
