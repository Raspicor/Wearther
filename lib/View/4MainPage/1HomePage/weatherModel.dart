import 'package:flutter/material.dart';

class Model{

  Widget getWeatherImg(int id, int sunrise, int sunset){
    int state = id ~/ 100;

    int unixTimeStamp = DateTime.now().millisecondsSinceEpoch;

    if(sunrise < unixTimeStamp && unixTimeStamp < sunset)
    {
      switch (state) {
        case 8:
          switch(id){
            case 800:
              return Image.asset(
                  "assets/weatherImage/01d.png"
              );
            case 801:
              return Image.asset(
                  "assets/weatherImage/02d.png"
              );
            case 802:
              return Image.asset(
                  "assets/weatherImage/03d.png"
              );
            default:
              return Image.asset(
                  "assets/weatherImage/04d.png"
              );
          }
        case 2:
          return Image.asset(
              "assets/weatherImage/11d.png"
          );
        case 3:
          return Image.asset(
              "assets/weatherImage/10d.png"
          );
        case 5:
          return Image.asset(
              "assets/weatherImage/09d.png"
          );
        case 6:
          return Image.asset(
              "assets/weatherImage/13d.png"
          );
        case 7:
          return Image.asset(
              "assets/weatherImage/50d.png"
          );
        default:
          return Text(
            "?",
          );
      }
    }
    else{
      switch (state) {
        case 8:
          switch(id){
            case 800:
              return Image.asset(
                  "assets/weatherImage/01n.png"
              );
            case 801:
              return Image.asset(
                  "assets/weatherImage/02n.png"
              );
            case 802:
              return Image.asset(
                  "assets/weatherImage/03n.png"
              );
            default:
              return Image.asset(
                  "assets/weatherImage/04n.png"
              );
          }
        case 2:
          return Image.asset(
              "assets/weatherImage/11n.png"
          );
        case 3:
          return Image.asset(
              "assets/weatherImage/10n.png"
          );
        case 5:
          return Image.asset(
              "assets/weatherImage/09n.png"
          );
        case 6:
          return Image.asset(
              "assets/weatherImage/13n.png"
          );
        case 7:
          return Image.asset(
              "assets/weatherImage/50n.png"
          );
        default:
          return Text(
            "?",
          );
      }
    }
  }
}
