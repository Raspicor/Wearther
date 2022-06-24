import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";

import 'package:wearther/View/4MainPage/1HomePage/network.dart';
import 'package:wearther/View/4MainPage/1HomePage/weatherModel.dart';
import 'package:wearther/ViewModel/BottomNavigationController.dart';


const apiKey = "68ab3764f5c848666c9704866ef9bcbc";

class WeatherBlock extends StatelessWidget {
  const WeatherBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 280.w,
      height: 150.h,
      top: 80.h,
      child: Content()
    );
  }
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  dynamic parsingData = null;
  Model model = Model();

  void getLocation() async{
    Network network;
    if(clientController.to.location1.value.compareTo("서울특별시") == 0){
      network = Network("https://api.openweathermap.org/data/2.5/weather?lat=${37.48}&lon=${126.93}&appid=$apiKey&units=metric");
    }
    else if(clientController.to.location1.value.compareTo("대구광역시") == 0){
      network = Network("https://api.openweathermap.org/data/2.5/weather?lat=${35.87}&lon=${128.61}&appid=$apiKey&units=metric");
    }
    else{
      network = Network("https://api.openweathermap.org/data/2.5/weather?lat=${35.99}&lon=${129.39}&appid=$apiKey&units=metric");
    }


    var parsingDat = await network.getJson();

    setState(() {
      parsingData = parsingDat;
      print(parsingDat);
    });

  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 385.h,
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 10.w, 10.h),
      alignment: Alignment(0.0, 0.0),
      decoration: BoxDecoration(
          color: Color(0xFFc4c4c4),
          borderRadius: BorderRadius.all(
              Radius.circular(30.0.w)
          )
      ),
      child: parsingData == null ? SpinKitCircle(
        color: Colors.white,
        size: 80.0,
      ) : Column(
        children: [
          Text("${parsingData["name"]}", style: TextStyle(
            fontSize: 15.sp,
          ),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${parsingData["main"]["temp"].round()}", style: TextStyle(
                fontSize: 30.sp,
              ),),
              Container(
                width: 70.w,
                child: model.getWeatherImg(parsingData["weather"][0]["id"], parsingData["sys"]["sunrise"], parsingData["sys"]["sunset"]),
              ),
              Spacer(),
              Text("습도", style: TextStyle(
                fontSize: 30.sp,
              ),),
              SizedBox(
                width: 5.w,
              ),
              Text("70%", style: TextStyle(
                fontSize: 30.sp,
              ),),
            ],
          ),
        ],
      ),
    );
  }
}