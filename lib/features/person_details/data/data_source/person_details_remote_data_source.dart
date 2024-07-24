import 'dart:developer';

import 'package:popular_people/core/config/end_points.dart';
import 'package:popular_people/core/handlers/error_handler/exceptions_handler.dart';
import 'package:popular_people/core/network/web_services.dart';
import 'package:popular_people/features/person_details/data/models/pereson_images_model.dart';
import 'package:popular_people/features/person_details/data/models/person_details_model.dart';

abstract class PersonDetailsRemoteDataSource {
  Future<PersonDetailsModel> getPersonDetails({required int id});
  Future<List<Profiles>> getPersonImages({required int id});
}

class PersonDetailsRemoteDataSourceImpl extends PersonDetailsRemoteDataSource {
  final Network network;

  PersonDetailsRemoteDataSourceImpl({
    required this.network,
  });
  @override
  Future<PersonDetailsModel> getPersonDetails({required int id}) async {
    final response =
        await network.get(url: ApiEndPoints.personDetails + id.toString());
    log('url: ${ApiEndPoints.baseUrl + ApiEndPoints.personDetails + id.toString()}');
    if (response.statusCode == 200) {
      return PersonDetailsModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Profiles>> getPersonImages({required int id}) async {
   
    final response = await network.get(
        url: ApiEndPoints.personDetails +
            id.toString() +
            ApiEndPoints.personImages);

    log('url: ${ApiEndPoints.baseUrl + ApiEndPoints.personDetails + id.toString()}');
    
    if (response.statusCode == 200) {
      return PersonImagesModel.fromJson(response.data).profiles!;
    } else {
      throw ServerException();
    }
  }
}
