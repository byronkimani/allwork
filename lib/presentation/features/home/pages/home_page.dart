import 'dart:async';
import 'package:allwork/constants/string_constants.dart';
import 'package:allwork/constants/theme.dart';
import 'package:allwork/infrastructure/api_calls.dart';
import 'package:allwork/presentation/features/home/widgets/home_drawer.dart';
import 'package:allwork/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? currentPosition;
  Geolocator geolocator = Geolocator();
  GoogleMapController? newGoogleMapController;

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-1.181056, 36.927234),
    zoom: 15.4746,
  );

  final Completer<GoogleMapController> _controllerGoogleMaps =
      Completer<GoogleMapController>();
  double bottomPaddingOfMap = 0;

  Future<void> locatePosition() async {
    final LocationPermission permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.always ||
        permission != LocationPermission.whileInUse) {
      final LocationPermission requestPermission =
          await Geolocator.requestPermission();

      if (!(requestPermission != LocationPermission.always ||
          requestPermission != LocationPermission.whileInUse)) {
        await Geolocator.openLocationSettings();
      }
    }
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentPosition = position;
    final LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    final CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition);

    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    final String address =
        await searchCoordinateAddress(position: position, context: context);
  }

  @override
  void initState() {
    super.initState();
    getCurrentLoggedOnUserInfo();
  }

  void saveServiceRequest() {}

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
        child: const HomeDrawer(),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            myLocationEnabled: true,
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMaps.complete(controller);
              newGoogleMapController = controller;
              setState(() {
                bottomPaddingOfMap = 250;
              });
              locatePosition();
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 250,
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
                                child: Image(image: AssetImage(plumberImage)),
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
                                child:
                                    Image(image: AssetImage(electricianImage)),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await getCurrentLoggedOnUserInfo();
                                },
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
                                child: Image(image: AssetImage(mechanicImage)),
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
