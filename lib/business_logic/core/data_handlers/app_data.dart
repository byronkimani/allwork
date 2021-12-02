import 'package:allwork/business_logic/core/data_handlers/models/address.dart';
import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  Address? userLocation;

  void updateUserLocation(Address userAddress) {
    userLocation = userAddress;
    notifyListeners();
  }
}
