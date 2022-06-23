import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Illust extends StatelessWidget {
  const Illust({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 180.h,
      width: context.width*0.7,
      child: Stack(
        children: [
          Image.asset(
            'assets/IllustImage/body/woman.png',
          ),
          Image.asset(
            'assets/IllustImage/clothings/신발/샌들/샌들_검은색.png',
          ),
          Image.asset(
            'assets/IllustImage/clothings/하의/바지/반바지_검은색.png',
          ),
          Image.asset(
            'assets/IllustImage/clothings/상의/셔츠/셔츠(넣입)_흰색.png',
          ),
          Image.asset(
            'assets/IllustImage/clothings/아우터/조끼/브이넥조끼_베이지색.png',
          ),
          Image.asset(
            'assets/IllustImage/clothings/기타/가방/에코백_흰색.png',
          ),
        ],
      ),
    );
  }
}
