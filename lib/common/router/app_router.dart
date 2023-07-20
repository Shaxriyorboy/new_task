import 'package:flutter/material.dart';
import 'package:new_task/feature/home/presentation/home_page.dart';
import '../../feature/login/presentation/login_page.dart';
import 'route_name.dart';

class AppRouter<T extends Object?> {
  const AppRouter();

  // ignore: long-method
  Route<T>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.HOME_PAGE:
        return MaterialPageRoute<T>(
            builder: (context) => const HomePage(), settings: settings);
      case AppRouteName.LOGIN_PAGE:
        return MaterialPageRoute<T>(
            builder: (context) => const LoginPage(), settings: settings);
      default:
        return null;
    }
  }

  Route<T> _errorRoute() => MaterialPageRoute<T>(builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Scaffold(
            body: Center(
              child: Text(
                'Error Route',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    // color: AppColors.black,
                    ),
              ),
            ),
          ),
        );
      });
}
