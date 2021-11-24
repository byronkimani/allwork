import 'package:allwork/business_logic/core/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Future<void> registerNewUser({
  required BuildContext context,
  required String phoneNumber,
  required String name,
  required String email,
  required String password,
}) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  try {
    userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      displaytoastMessage(message: 'Password too weak');
    } else if (e.code == 'email-already-in-use') {
      displaytoastMessage(
        message: 'The account already exists for that email.',
      );
    }
  } catch (e) {
    displaytoastMessage(message: e.toString());
  }
  displaytoastMessage(message: 'Account created successfully!');

  if (userCredential != null) {
    // ignore: always_specify_types
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    users
        .add(<String, dynamic>{
          'name': name,
          'phoneNumber': phoneNumber,
          'email': email,
        })
        .then((DocumentReference<Object?> value) =>
            displaytoastMessage(message: 'User added successfully'))
        .catchError((dynamic error) =>
            displaytoastMessage(message: 'Failed to add user'));
  } else {
    displaytoastMessage(message: 'New user account not created');
  }
}
