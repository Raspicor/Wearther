import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool ifStarted = false;
  final int animationDuration = 600;

  //const LoadingPage({Key? key}) : super(key: key);

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        ifStarted = true;
      });

      Future.delayed(Duration(milliseconds: 1000), () {
        Get.toNamed("/TestNextPage",);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            top: 341.h,
            left: ifStarted ? 102.w : 123.w,
            duration: Duration(milliseconds: animationDuration),
            curve: Curves.easeInOut,
            child: AnimatedOpacity(
                opacity: ifStarted ? 1.0 : 0.0,
                duration: Duration(milliseconds: animationDuration + 100),
                child: Image.asset(
                  'assets/LoadingImage/wearther.png',
                ),
            ),
          ),

          AnimatedPositioned(
            top: 364.h,
            left: ifStarted ? 206.w : 154.w,
            duration: Duration(milliseconds: animationDuration),
            curve: Curves.easeInOut,
            child: Image.asset(
              'assets/LoadingImage/R.png'
            ),
          )
        ]
      )
    );
  }
}