// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';


class GetLocationInfo{

  late double  lati;
  late double longi;

  Future getLocationcords()async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lati = position.latitude;
      longi = position.longitude;
    }
    catch(e){
      print('ERROR OCCURRED');
    }
  }

}