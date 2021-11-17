import 'package:allwork/constants/string_constants.dart';
import 'package:allwork/constants/theme.dart';
import 'package:allwork/presentation/features/onboarding/pages/welcome_page.dart';
import 'package:allwork/presentation/router/app_router.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: apptheme,
      home: const WelcomePage(),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
