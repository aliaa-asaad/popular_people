import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:popular_people/core/handlers/shared_handler.dart';
import 'package:popular_people/core/network/web_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => NetworkImpl.init());
  sl.registerLazySingleton(() => SharedHandler(sharedPreferences: sl()));

//! External

/* final sharedHandler =   sl<SharedHandler>();
  sl.<SharedHandler>(); */
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
