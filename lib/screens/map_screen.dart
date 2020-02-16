import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) {},
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7906386, -122.390079),
        ),
      ),
    );
  }
}
