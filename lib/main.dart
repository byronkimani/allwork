import 'package:allwork/presentation/core/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  /// [WidgetsFlutterBinding.ensureInitialized] enables us to call the native code in order to get the path

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(AppWidget());
}
