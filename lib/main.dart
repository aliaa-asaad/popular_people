import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popular_people/core/di/dependency_injection.dart' as di;
import 'package:popular_people/core/routing/navigator.dart';
import 'package:popular_people/core/routing/routes.dart';
import 'package:popular_people/core/utilities/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          title: 'Popular People',
          theme: AppTheme.lightTheme,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: Routes.popularPeople,
          navigatorKey: AppRoutes.navigatorState,
          navigatorObservers: [AppRoutes.routeObserver],
          scaffoldMessengerKey: AppRoutes.scaffoldState,
          debugShowCheckedModeBanner: false
          //  home: const PopularPeopleScreen(),
          ),
    );
  }
}
