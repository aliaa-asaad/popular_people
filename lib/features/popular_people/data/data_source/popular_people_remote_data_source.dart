import 'dart:developer';

import 'package:popular_people/core/config/end_points.dart';
import 'package:popular_people/core/handlers/error_handler/exceptions_handler.dart';
import 'package:popular_people/core/network/web_services.dart';
import 'package:popular_people/features/popular_people/data/models/images_model.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';

abstract class PopularPeopleRemoteDataSource {
  Future<PopularPeopleModel> get(Map<String, dynamic> query);
  Future<Images> getImages();
}

class PopularPeopleRemoteDataSourceImpl extends PopularPeopleRemoteDataSource {
  final Network network;

  PopularPeopleRemoteDataSourceImpl({
    required this.network,
  });
  @override
  Future<PopularPeopleModel> get(Map<String, dynamic> query) async {
    final response =
        await network.get(url: ApiEndPoints.popularPeople, query: query);
    log('url: ${ApiEndPoints.baseUrl + ApiEndPoints.popularPeople + query.toString()}');
    if (response.statusCode == 200) {
      return PopularPeopleModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Images> getImages() async {
    final response = await network.get(
      url: ApiEndPoints.images,
    );
    log('url: ${ApiEndPoints.baseUrl + ApiEndPoints.images}');
    if (response.statusCode == 200) {
      return ImagesModel.fromJson(response.data).images!;
    } else {
      throw ServerException();
    }
  }
}
