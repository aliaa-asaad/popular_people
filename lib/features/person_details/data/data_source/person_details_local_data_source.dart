import 'package:dartz/dartz.dart';
import 'package:popular_people/features/person_details/data/models/pereson_images_model.dart';
import 'package:popular_people/features/person_details/data/models/person_details_model.dart';

abstract class PersonDetailsLocalDataSource {
  Future<PersonDetailsModel> getCachedPersonDetails();
  Future<List<Profiles>> getCachedPersonImages();
  Future<Unit> cachePersonDetails(PersonDetailsModel personDetailsModel);

}

class PersonDetailsLocalDataSourceImpl extends PersonDetailsLocalDataSource {
  @override
  Future<PersonDetailsModel> getCachedPersonDetails() {
    throw UnimplementedError();
  }
  
  @override
  Future<Unit> cachePersonDetails(PersonDetailsModel personDetailsModel) {
    // TODO: implement cachePersonDetails
    throw UnimplementedError();
  }
  
  @override
  Future<List<Profiles>> getCachedPersonImages() {
    // TODO: implement getCachedPersonImages
    throw UnimplementedError();
  }
}
