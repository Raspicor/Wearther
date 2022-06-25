import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wearther/View/4MainPage/1HomePage/Illust.dart';
import 'package:wearther/View/4MainPage/1HomePage/WeatherBlock.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        WeatherBlock(),
        IllustContent(),
      ],
    );
  }
}