import 'package:allwork/constants/string_constants.dart';
import 'package:allwork/constants/theme.dart';
import 'package:allwork/presentation/features/onboarding/widgets/onboarding_pages_background.dart';
import 'package:allwork/presentation/features/onboarding/widgets/registration_form.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double bottomPadding = mediaQuery.viewInsets.bottom;
    final double containerHeight =
        (mediaQuery.size.height * 0.8) - bottomPadding;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          const OnboardingPagesBackground(appName),
          Container(
            width: double.infinity,
            height: containerHeight,
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: ListView(
              children: const <Widget>[
                Text(
                  createAccount,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: accentColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  createAccountTitle,
                  style: TextStyle(
                    fontSize: 20,
                    color: accentColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  createAccountSubtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: accentColor,
                  ),
                ),
                SizedBox(height: 10),
                RegistrationForm()
              ],
            ),
          )
        ],
      ),
    );
  }
}
