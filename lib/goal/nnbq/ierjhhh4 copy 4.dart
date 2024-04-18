import 'package:flutter/material.dart';

class MapScreenKJBkjsnkDsa extends StatelessWidget {
  void getCurrentLocation() {
    print("Current location acquired");
  }

  void findNearbyPlaces() {
    print("Nearby places found");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: getCurrentLocation,
              child: Text('Get Current Location'),
            ),
            ElevatedButton(
              onPressed: findNearbyPlaces,
              child: Text('Find Nearby Places'),
            ),
          ],
        ),
      ),
    );
  }
}
