import 'package:allwork/presentation/features/error/page_not_found.dart';
import 'package:allwork/presentation/features/main/pages/main_screen.dart';
import 'package:allwork/presentation/features/mechanics/pages/mechanics_page.dart';
import 'package:allwork/presentation/features/onboarding/pages/create_account_page.dart';
import 'package:allwork/presentation/features/onboarding/pages/login_page.dart';
import 'package:allwork/presentation/features/onboarding/pages/onboarding_pages.dart';
import 'package:allwork/presentation/features/onboarding/pages/welcome_page.dart';
import 'package:allwork/presentation/features/plumbers/pages/plumbers_page.dart';
import 'package:allwork/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings?.name) {
      case welcomePageRoute:
        return MaterialPageRoute<WelcomePage>(
          builder: (_) => const WelcomePage(),
        );

      case onboardingPagesRoute:
        return MaterialPageRoute<OnboardingPages>(
          builder: (_) => const OnboardingPages(),
        );

      case loginPageRoute:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => const LoginPage(),
        );

      case createAccountPageRoute:
        return MaterialPageRoute<CreateAccountPage>(
          builder: (_) => const CreateAccountPage(),
        );

      case mainScreenRoute:
        return MaterialPageRoute<MainScreeen>(
          builder: (_) => const MainScreeen(),
        );

      case plumbersPageRoute:
        return MaterialPageRoute<PlumbersPage>(
          builder: (_) => const PlumbersPage(),
        );
      case electricianPageRoute:
        return MaterialPageRoute<MainScreeen>(
          builder: (_) => const MainScreeen(),
        );
      case mechanicPageRoute:
        return MaterialPageRoute<MechanicsPage>(
          builder: (_) => const MechanicsPage(),
        );

      default:
        return MaterialPageRoute<PageNotFound>(
          builder: (_) => const PageNotFound(),
        );
    }
  }
}
