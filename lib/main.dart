import 'package:allwork/presentation/core/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  /// [WidgetsFlutterBinding.ensureInitialized] enables us to call the native code in order to get the path
  /// [HydratedBloc.storage] async creates the connection between hydrated bloc and the storage
  /// where the data will be stored.
  /// [HydratedBloc.build] takes in the directory where the data will be saved
  /// [getApplicationDocumentsDirectory] gets the storage directory provided by the OS to the app.

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(AppWidget());
}
