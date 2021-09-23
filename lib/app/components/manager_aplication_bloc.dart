import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api/app/services/geolocator_service.dart';

class ManagerAplicationBloc with ChangeNotifier{
  final geoLocatorService = GeolocatorService();

  late Position currentLocation;

  ManagerAplicationBloc(){
    getCurrenteLocation();
  }

  getCurrenteLocation() async{
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }
}