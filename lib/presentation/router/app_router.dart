import 'package:allwork/presentation/features/error/page_not_found.dart';
import 'package:allwork/presentation/features/onboarding/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings?.name) {
      case '':
        return MaterialPageRoute<WelcomePage>(
          builder: (_) => const WelcomePage(),
        );

      default:
        return MaterialPageRoute<PageNotFound>(
          builder: (_) => const PageNotFound(),
        );
    }
  }
}
