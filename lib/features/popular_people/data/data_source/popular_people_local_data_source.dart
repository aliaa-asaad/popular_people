import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';

abstract class PopularPeopleLocalDataSource {
  Future<PopularPeopleModel> getPopularPeople();
}

class PopularPeopleLocalDataSourceImpl extends PopularPeopleLocalDataSource {
  @override
  Future<PopularPeopleModel> getPopularPeople() {
    throw UnimplementedError();
  }
}
