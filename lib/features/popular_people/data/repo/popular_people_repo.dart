import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:popular_people/core/handlers/error_handler/exceptions_handler.dart';
import 'package:popular_people/core/handlers/error_handler/failure.dart';
import 'package:popular_people/core/network/network_info.dart';
import 'package:popular_people/features/popular_people/data/data_source/popular_people_local_data_source.dart';
import 'package:popular_people/features/popular_people/data/data_source/popular_people_remote_data_source.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';

abstract class PopularPeopleRepo {
  Future<Either<Failure, PopularPeopleModel>> getPopularPeople(
      {required Map<String, dynamic> query});
}

class PopularPeopleRepoImpl extends PopularPeopleRepo {
  final PopularPeopleRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final PopularPeopleLocalDataSource localDataSource;
  PopularPeopleRepoImpl(
      {required this.networkInfo,
      required this.localDataSource,
      required this.remoteDataSource});

  @override
  Future<Either<Failure, PopularPeopleModel>> getPopularPeople(
      {required Map<String, dynamic> query}) async {
    if (await networkInfo.isConnected) {
      try {
        log('query: $query');
        final result = await remoteDataSource.get(query);

        await localDataSource.cachePopularPeople(result);
        
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final result = await localDataSource.getCachedPopularPeople();
        return Right(result);
      } on EmptyCachedException {
        return Left(EmptyCachedFailure());
      }
    }
  }
}
