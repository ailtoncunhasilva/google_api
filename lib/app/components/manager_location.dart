import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ManagerLocation extends ChangeNotifier {
  late Location _location;
  late LatLng _locationPosition;
  late BitmapDescriptor _iconLocation;
  late Map<MarkerId, Marker> _markers;

  final MarkerId markerId = MarkerId('1');

  bool locationServiceActive = true;

  ManagerLocation() {
    _location = Location();
    getUserLocation();
    setCustomMapLocation();
  }

  getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.onLocationChanged.listen((LocationData currentLocation) async {
      _locationPosition = LatLng(
        currentLocation.latitude ?? 0.0,
        currentLocation.longitude ?? 0.0,
      );

      print(_locationPosition);

      _markers = <MarkerId, Marker>{};
      Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
          currentLocation.latitude ?? 0.0,
          currentLocation.longitude ?? 0.0,
        ),
        icon: iconLocation,
        draggable: true,
        onDragEnd: ((newLocation) {
          _locationPosition = LatLng(
            newLocation.latitude,
            newLocation.longitude,
          );

          notifyListeners();
        }),
      );
      _markers[markerId] = marker;

      notifyListeners();
    });
  }

  setCustomMapLocation() async {
    _iconLocation = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'images/iconlocation_on.png',
    );
  }

  Location get location => _location;

  LatLng get locationPosition => _locationPosition;

  BitmapDescriptor get iconLocation => _iconLocation;

  Map<MarkerId, Marker> get markers => _markers;
}
