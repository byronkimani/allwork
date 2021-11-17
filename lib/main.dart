import 'package:allwork/business_logic/core/simple_bloc_observer.dart';
import 'package:allwork/presentation/core/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  /// [WidgetsFlutterBinding.ensureInitialized] enables us to call the native code in order to get the path
  /// [HydratedBloc.storage] async creates the connection between hydrated bloc and the storage
  /// where the data will be stored.
  /// [HydratedBloc.build] takes in the directory where the data will be saved
  /// [getApplicationDocumentsDirectory] gets the storage directory provided by the OS to the app.

  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp();

  Bloc.observer = SimpleBlocObserver();
  runApp(AppWidget());
}
