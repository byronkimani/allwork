import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:allwork/business_logic/core/data_handlers/app_data.dart';
import 'package:allwork/business_logic/core/data_handlers/models/address.dart';
import 'package:allwork/business_logic/core/data_handlers/models/user.dart';
import 'package:allwork/business_logic/core/helpers.dart';
import 'package:allwork/constants/string_constants.dart';
import 'package:allwork/infrastructure/config_maps.dart';
import 'package:allwork/infrastructure/dio_client.dart';
import 'package:allwork/presentation/core/progress_dialog.dart';
import 'package:allwork/presentation/router/routes.dart';

Future<void> registerNewUser({
  required BuildContext context,
  required String phoneNumber,
  required String name,
  required String email,
  required String password,
}) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const ProgressDialog(message: 'Creating your account');
      });
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  try {
    userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Navigator.of(context).pop();
      displaytoastMessage(message: 'Password too weak');
      return;
    } else if (e.code == 'email-already-in-use') {
      Navigator.of(context).pop();
      displaytoastMessage(
        message: 'The account already exists for that email.',
      );
      return;
    }
  } catch (e) {
    Navigator.of(context).pop();
    displaytoastMessage(message: e.toString());
    return;
  }
  Navigator.of(context).pop();
  displaytoastMessage(message: 'Account created successfully!');

  if (userCredential != null) {
    // ignore: always_specify_types
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    users.doc(userCredential.user!.uid).set(<String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
    }).then(
      (_) {
        displaytoastMessage(message: accountCreatedSuccess);
        Navigator.of(context).pushReplacementNamed(homePageRoute);
      },
    ).catchError(
      (dynamic error) {
        displaytoastMessage(message: 'Failed to add user');
      },
    );
  } else {
    displaytoastMessage(message: 'New user account not created');
  }
}

Future<void> signInWithEmailAndPass({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const ProgressDialog(message: 'Logging you in...');
      });
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Navigator.of(context).pop();

      displaytoastMessage(message: 'No user found for that email.');
      return;
    } else if (e.code == 'wrong-password') {
      Navigator.of(context).pop();
      displaytoastMessage(message: 'Wrong password provided for that user.');
      return;
    }
  }
  displaytoastMessage(message: 'Logged in successfully');
  Navigator.of(context).pushReplacementNamed(homePageRoute);
}

Future<String> searchCoordinateAddress({
  required Position position,
  required BuildContext context,
}) async {
  String placeAddress = '';
  final String url =
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey2';
  final dynamic response = await getRequest(url);
  if (response != 'Failed') {
    placeAddress = response['results'][0]['formatted_address'] as String;
    final Address userAddress = Address(
      longitude: position.longitude,
      latitude: position.latitude,
      formattedAddress: placeAddress,
    );

    Provider.of<AppData>(context, listen: false)
        .updateUserLocation(userAddress);
  }
  return placeAddress;
}

Future<void> getCurrentLoggedOnUserInfo() async {
  firebaseUser = FirebaseAuth.instance.currentUser;
  final String userId = firebaseUser!.uid;
  FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .get()
      .then((DocumentSnapshot<Object?> documentSnapshot) {
    if (documentSnapshot.exists) {
      userCurrentInfo = Users.fromSnapshot(documentSnapshot);
    } else {
      print('Document does not exist on the database');
    }
  });
}
