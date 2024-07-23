import 'package:popular_people/core/config/end_points.dart';
import 'package:popular_people/core/handlers/error_handler/exceptions_handler.dart';
import 'package:popular_people/core/network/web_services.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';

abstract class PopularPeopleRemoteDataSource {
  Future<PopularPeopleModel> get( Map<String, dynamic> query);
}

class PopularPeopleRemoteDataSourceImpl extends PopularPeopleRemoteDataSource {
  final Network network;

  PopularPeopleRemoteDataSourceImpl({
    required this.network,
  });
  @override
  Future<PopularPeopleModel> get( Map<String, dynamic> query) async {
    final response = await network.get(url: ApiEndPoints.popularPeople, query: query);
    if (response.statusCode == 200) {
      return PopularPeopleModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
