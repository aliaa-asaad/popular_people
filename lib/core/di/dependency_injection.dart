import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:popular_people/core/handlers/shared_handler.dart';
import 'package:popular_people/core/network/network_info.dart';
import 'package:popular_people/core/network/web_services.dart';
import 'package:popular_people/features/person_details/data/data_source/person_details_local_data_source.dart';
import 'package:popular_people/features/person_details/data/data_source/person_details_remote_data_source.dart';
import 'package:popular_people/features/person_details/data/repo/person_details_repo.dart';
import 'package:popular_people/features/person_details/presentation/view_model/cubit/person_details_cubit.dart';
import 'package:popular_people/features/popular_people/data/data_source/popular_people_local_data_source.dart';
import 'package:popular_people/features/popular_people/data/data_source/popular_people_remote_data_source.dart';
import 'package:popular_people/features/popular_people/data/repo/popular_people_repo.dart';
import 'package:popular_people/features/popular_people/presentation/view_model/cubit/popular_people_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
// cubit

  sl.registerFactory(() => PopularPeopleCubit(popularPeopleRepo: sl()));
  sl.registerFactory(() => PersonDetailsCubit(personDetailsRepo: sl()));

// Repository

  sl.registerLazySingleton<PopularPeopleRepo>(() => PopularPeopleRepoImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));
      sl.registerLazySingleton<PersonDetailsRepo>(() => PersonDetailsRepoImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

// Datasources

  sl.registerLazySingleton<PopularPeopleRemoteDataSource>(
      () => PopularPeopleRemoteDataSourceImpl(network: sl()));
sl.registerLazySingleton<PersonDetailsRemoteDataSource>(
      () => PersonDetailsRemoteDataSourceImpl(network: sl()));
//todo: add local data source
  sl.registerLazySingleton<PopularPeopleLocalDataSource>(
      () => PopularPeopleLocalDataSourceImpl(/* sharedHandler:  sl() */));
      sl.registerLazySingleton<PersonDetailsLocalDataSource>(
      () =>PersonDetailsLocalDataSourceImpl(/* sharedHandler:  sl() */));

//Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<Network>(() => NetworkImpl.init());
  sl.registerLazySingleton(() => SharedHandler(sharedPreferences: sl()));
/* final sharedHandler =   sl<SharedHandler>();
  sl.<SharedHandler>(); */
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
