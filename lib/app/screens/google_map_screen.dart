import 'package:flutter/material.dart';
import 'package:google_api/app/components/manager_aplication_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../const.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final aplicationBloc = Provider.of<ManagerAplicationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, User'),
      ),
      // ignore: unnecessary_null_comparison
      body: (aplicationBloc == null)
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                _buildGoogleMap(),
                _buildTextFieldPositionAndDestination(),
              ],
            ),
    );
  }

  Widget _buildGoogleMap() {
    final location = Provider.of<ManagerAplicationBloc>(context);

    return Container(
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            location.currentLocation.latitude,
            location.currentLocation.longitude,
          ),
          zoom: 16,
        ),
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        //markers: Set<Marker>.of(managerLocation.markers.values),
      ),
    );
  }

  Widget _buildTextFieldPositionAndDestination() {
    return Positioned(
      right: kSpacing,
      left: kSpacing,
      bottom: kSpacing,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.local_taxi),
              hintText: 'Pra onde vamos?',
              hintStyle: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
}
