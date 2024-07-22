import 'package:flutter/material.dart';
import 'package:popular_people/core/routing/routes.dart';
import 'package:popular_people/features/popular_people/presentation/view/screens/popular_people_screen.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.popularPeople:
        return MaterialPageRoute(builder: (context) => const PopularPeopleScreen());
  
      default:
        return AppRoutes.aniamtedNavigation(
            screen: const Scaffold(
          body: Center(child: Text('Error')),
        ));
    }
  }

  static aniamtedNavigation({
    required Widget screen,
  }) {
    return PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen);
  }

  static pushNamedNavigator(
      {required String routeName,
      Object? arguments,
      bool replacement = false,
      bool replacementAll = false}) {
    if (replacement == true) {
      navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else if (replacementAll == true) {
      navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (route) => false,
          arguments: arguments);
    } else {
      navigatorState.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }
}
