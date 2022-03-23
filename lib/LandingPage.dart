// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

const unsplashApi = 'fXEOnvTcTrugJiwfqEoBnmdsiMhJ7f6m--9yfyJ__1Y';

class LandingPage extends StatefulWidget {
  LandingPage({this.location, this.image});

  final location;
  final image;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var temperature;
  var cityname;
  var feelslike;
  var imageURL;

  @override
  void initState() {
    super.initState();
    updateUI(widget.location, widget.image);
  }

  void updateUI(dynamic weatherData, dynamic imageData) {
    var cityName = weatherData['name'];
    cityname = cityName;

    var tempa = weatherData['main']['temp'];
    temperature = tempa.toInt();

    var feelsLike = weatherData['main']['feels_like'];
    feelslike = feelsLike.toInt();

    var backgroundImage = imageData['results'][0]['urls']['regular'];
    imageURL = backgroundImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          CupertinoIcons.location_fill,
          color: Colors.black,
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Weather",
          style: kappbarstyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              child: const Icon(
                CupertinoIcons.search,
                color: Colors.black,
              ),
              onTap: () {},
            ),
          )
        ],
      ),
      body: Container(
        height: 100 ,
        child :Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(CupertinoIcons.sun_min,size: 50,color: Colors.amberAccent,),
            title: Text("It is $temperature in $cityname",style: kappbarstyle,),
            subtitle: Text("Feels like $feelslike"),
          ),
        ),
      ),
      ),
    );
  }
}
