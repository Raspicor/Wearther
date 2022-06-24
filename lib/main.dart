import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wearther/View/1LoadingPage/TestNextPage.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:wearther/View/2LoginPage/logInPage.dart';
import 'package:wearther/View/2LoginPage/signUpPage.dart';
import 'package:wearther/View/2LoginPage/userInfoPage.dart';
import 'package:wearther/View/3InitialChoosePage/InitialChoosePage.dart';
import 'package:wearther/View/4MainPage/2MapPage/MapPage.dart';
import 'package:wearther/View/4MainPage/3CommunityPage/CommunityPage.dart';
import 'package:wearther/View/4MainPage/4MyPage/MyPage.dart';
import 'package:wearther/View/4MainPage/MainPage.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

import 'View/1LoadingPage/LoadingPage.dart';
import 'View/1LoadingPage/TestNextPage.dart';
import 'View/3InitialChoosePage/KakaoMapPage.dart';
import 'package:wearther/ViewModel/BottomNavigationController.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'c1515cde45f1bb8f3192b8fd1c3bebb9');
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
            GetPage(name: "/Load", page: () => LoadingPage(), transition: Transition.fadeIn, binding: BindingsBuilder(
                    () => Get.lazyPut<clientController>(() => clientController()))),
            GetPage(name: "/Main", page: () => MainPage(), transition: Transition.fadeIn),
            GetPage(name: "/Login", page: () => logInPage(), transition: Transition.fadeIn),
            GetPage(name: "/InitChoose", page: () => InitialChoosePage(), transition: Transition.fadeIn),
            GetPage(name: "/SignUp", page: () => signUpPage(), transition: Transition.fadeIn),
            GetPage(name: "/userInfo", page: () => userInfoPage(), transition: Transition.fadeIn),

            //테스트 페이지
            GetPage(name: "/TestNextPage", page: () => TestNextPage(), transition: Transition.fadeIn),
            GetPage(name: "/KakaoMapPage", page: () => KakaoMapPage(), transition: Transition.fadeIn),
            GetPage(name: "/KakaoMapPage2", page: () => KakaoMapPage2(), transition: Transition.fadeIn),

          ],
        );
      }
    );
  }
}
