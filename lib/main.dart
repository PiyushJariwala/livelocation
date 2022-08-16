import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:livelocation/splash.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>MySplashScreen(),
        '/location': (context) => LiveLocationHome(),
      },
    ),
  );
}

class LiveLocationHome extends StatefulWidget {
  const LiveLocationHome({Key? key}) : super(key: key);

  @override
  State<LiveLocationHome> createState() => _LiveLocationHomeState();
}

class _LiveLocationHomeState extends State<LiveLocationHome> {
  Completer<GoogleMapController> _controller = Completer();

  LatLng latLng = LatLng(21.1702, 72.8311);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  MapType _mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: latLng,
                zoom: 11,
              ),
              mapType: _mapType,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    if (_mapType == MapType.normal) {
                      setState(() {
                        _mapType = MapType.satellite;
                      });
                    } else {
                      setState(() {
                        _mapType = MapType.normal;
                      });
                    }
                  },
                  child: Icon(Icons.map),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
