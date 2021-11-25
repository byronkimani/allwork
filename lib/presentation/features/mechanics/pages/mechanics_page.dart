import 'package:allwork/constants/theme.dart';
import 'package:flutter/material.dart';

class MechanicsPage extends StatelessWidget {
  const MechanicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mechanics'),
        backgroundColor: accentColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: <Widget>[
            Container(
              height: 120,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
