import 'package:dartz/dartz.dart';
import 'package:popular_people/core/handlers/error_handler/exceptions_handler.dart';
import 'package:popular_people/core/handlers/error_handler/failure.dart';
import 'package:popular_people/features/popular_people/data/data_source/popular_people_remote_data_source.dart';

class PopularPeopleRepo {
  final PopularPeopleRemoteDataSource remoteDataSource;

  PopularPeopleRepo({required this.remoteDataSource});

  /* Future<Either<Failure, List>> getPopularPeople() async {
   
  } */
}