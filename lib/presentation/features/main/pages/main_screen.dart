import 'dart:async';

import 'package:allwork/constants/string_constants.dart';
import 'package:allwork/constants/theme.dart';
import 'package:allwork/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainScreeen extends StatefulWidget {
  const MainScreeen();

  @override
  State<MainScreeen> createState() => _MainScreeenState();
}

class _MainScreeenState extends State<MainScreeen> {
  GoogleMapController? newGoogleMapController;

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-1.181056, 36.927234),
    zoom: 15.4746,
  );

  final Completer<GoogleMapController> _controllerGoogleMaps =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: accentColor,
      ),
      drawer: Container(
        color: whiteColor,
        width: 255,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 165,
                width: double.infinity,
                child: DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: Column(
                    children: const <Widget>[
                      Icon(Icons.account_circle, size: 50),
                      Text('John Doe'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 10),
                        Text('Payment'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.account_circle),
                        SizedBox(width: 10),
                        Text('Account'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.settings),
                        SizedBox(width: 10),
                        Text('Settings'),
                      ],
                    ),
                    // TextButton(onPressed: () {}, child: Text('SIGN OUT'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMaps.complete(controller);
              newGoogleMapController = controller;
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 245,
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 16,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Hey there!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    const Text(
                      'What are you looking for today?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 100,
                                child: Image(
                                  image: AssetImage(plumberImage),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(plumbersPageRoute);
                                },
                                child: const Text(
                                  'Plumber',
                                  style: TextStyle(color: accentColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 100,
                                width: 120,
                                child: Image(
                                  image: AssetImage(electricianImage),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Electrician',
                                  style: TextStyle(color: accentColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 100,
                                child: Image(
                                  image: AssetImage(mechanicImage),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Mechanic',
                                  style: TextStyle(color: accentColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
