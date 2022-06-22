import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wearther/View/LoadingPage/TestNextPage.dart';

import 'View/LoadingPage/LoadingPage.dart';

void main() {
  runApp(const WeartherApp());
}

class WeartherApp extends StatelessWidget {
  const WeartherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,800),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wearther',
          // theme: ThemeData(
          //     fontFamily: 'master'
          // ),
          initialRoute: "/Load",
          routingCallback: (route) {},
          getPages: [
            GetPage(name: "/Load", page: () => LoadingPage(), transition: Transition.fadeIn),

            //테스트 페이지
            GetPage(name: "/TestNextPage", page: () => TestNextPage(), transition: Transition.fadeIn)
          ],
        );
      }
    );
  }
}
