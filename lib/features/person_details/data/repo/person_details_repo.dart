import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:popular_people/core/handlers/error_handler/exceptions_handler.dart';
import 'package:popular_people/core/handlers/error_handler/failure.dart';
import 'package:popular_people/core/network/network_info.dart';
import 'package:popular_people/features/person_details/data/data_source/person_details_local_data_source.dart';
import 'package:popular_people/features/person_details/data/data_source/person_details_remote_data_source.dart';
import 'package:popular_people/features/person_details/data/models/pereson_images_model.dart';
import 'package:popular_people/features/person_details/data/models/person_details_model.dart';

abstract class PersonDetailsRepo {
  Future<Either<Failure, PersonDetailsModel>> getPersonDetails(
      {required int id});
  Future<Either<Failure, List<Profiles>>> getPersonImages({required int id});
}

class PersonDetailsRepoImpl extends PersonDetailsRepo {
  final PersonDetailsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final PersonDetailsLocalDataSource localDataSource;
  PersonDetailsRepoImpl(
      {required this.networkInfo,
      required this.localDataSource,
      required this.remoteDataSource});

  @override
  Future<Either<Failure, PersonDetailsModel>> getPersonDetails(
      {required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        log('id: $id');
        final result = await remoteDataSource.getPersonDetails(id: id);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final result = await localDataSource.getCachedPersonDetails();
        return Right(result);
      } on EmptyCachedException {
        return Left(EmptyCachedFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Profiles>>> getPersonImages(
      {required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        log('id: $id');
        final result = await remoteDataSource.getPersonImages(id: id);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final result = await localDataSource.getCachedPersonImages();
        return Right(result);
      } on EmptyCachedException {
        return Left(EmptyCachedFailure());
      }
    }
  }
}
