import 'package:dartz/dartz.dart';
import 'package:popular_people/core/di/dependency_injection.dart' as di;
import 'package:popular_people/core/handlers/shared_handler.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';

abstract class PopularPeopleLocalDataSource {
  Future<PopularPeopleModel> getCachedPopularPeople();
  Future<Unit> cachePopularPeople(PopularPeopleModel popularPeopleModel);
}

class PopularPeopleLocalDataSourceImpl extends PopularPeopleLocalDataSource {
  @override
  Future<PopularPeopleModel> getCachedPopularPeople() async {
    final popularPeople = di
        .sl<SharedHandler>()
        .getData(key: SharedKeys().popularPeople, valueType: ValueType.map);
    return PopularPeopleModel.fromJson(popularPeople);
  }

  @override
  Future<Unit> cachePopularPeople(PopularPeopleModel popularPeopleModel) async {
    await di.sl<SharedHandler>().setData(SharedKeys().popularPeople,
        value: popularPeopleModel.toJson());

    return Future.value(unit);
  }
}
