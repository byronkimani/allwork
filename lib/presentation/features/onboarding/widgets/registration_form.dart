import 'package:allwork/constants/string_constants.dart';
import 'package:allwork/constants/theme.dart';
import 'package:allwork/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm();

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(fontSize: 14),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              style: TextStyle(fontSize: 14),
            ),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 14),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              style: TextStyle(fontSize: 14),
            ),
            const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(fontSize: 14),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              style: TextStyle(fontSize: 14),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
                labelStyle: TextStyle(fontSize: 14),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              style: TextStyle(fontSize: 14),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Re-enter password',
                labelStyle: TextStyle(fontSize: 14),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaQuery.size.width * 0.15, vertical: 15),
              ),
              child: const Text(
                createAccount,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(alreadyHaveAnAccount),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(loginPageRoute);
                  },
                  child: const Text(
                    signInHere,
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
