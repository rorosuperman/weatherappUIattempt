// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:untitled1/constants.dart';
import 'networking.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/LandingPage.dart';
import 'package:untitled1/Weather.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

const kAPIkey = '7501217fc96bc2d2927e2204a1540ba6';


class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  //triggering without clicking on anything
  @override
  void initState() {
    getLocation();
    super.initState();
  }
  //getting the weather cords (longitude & latitude)
  void getLocation() async {
    GetLocationInfo location = GetLocationInfo();
    await location.getLocationcords();
    NetworkHelper networkHelper = NetworkHelper(
        url: 'https://api.openweathermap.org/data/2.5/weather?lat=${location.lati}&lon=${location.longi}&appid=$kAPIkey&units=metric');
    var weatherdata = await networkHelper.getData();

    Imagefinder imagefinder = Imagefinder();
   var imageurl = await  imagefinder.GetImageUrl();
    //cant call in build because we need the data of location and latitude
    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return LandingPage(location: weatherdata,image: imageurl,);
    }));
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CupertinoActivityIndicator(),
          SizedBox(height: 20,),
          Text('Fetching weather details for your location \n Please wait.',
          textAlign: TextAlign.center,style: kloadingtextstyle)
        ],
      ),
    );
  }
}
class Imagefinder{
  Future GetImageUrl()async {
    http.Response response = await http.get(Uri.parse('https://api.unsplash.com/search/photos?page=1&query=rain&client_id=$unsplashApi'));
    if (response.statusCode == 200) {
      String data1 = response.body;
      return  jsonDecode(data1);
      // var imageurl = imagedata['results'][0]['urls']['small'];
      // print(imageurl);
    }
    else {
      print(response.statusCode);
    }
  }
}