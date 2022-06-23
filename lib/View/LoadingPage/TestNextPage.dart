import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:wearther/View/MainPage/MainPage.dart';
import 'package:wearther/ViewModel/BottomNavigationController.dart';

class TestNextPage extends StatelessWidget {
  const TestNextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text(
            "카카오톡 로그인"
          ),
          onPressed: () async {
            if (await isKakaoTalkInstalled()) {
              try {
                await UserApi.instance.loginWithKakaoTalk();
                print('카카오톡으로 로그인 성공');
              } catch (error) {
                print('카카오톡으로 로그인 실패 $error');

                // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
                // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
                if (error is PlatformException && error.code == 'CANCELED') {
                  return;
                }
                // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                try {
                  await UserApi.instance.loginWithKakaoAccount();
                  print('카카오계정으로 로그인 성공');
                } catch (error) {
//                  Get.toNamed("/Main");
                  Get.to(MainPage(), binding: BindingsBuilder(() => Get.lazyPut<BottomNavigationController>(() => BottomNavigationController())));
                  print('카카오계정으로 로그인 실패 $error');
                }
              }
            } else {
              try {
                await UserApi.instance.loginWithKakaoAccount();
                print('카카오계정으로 로그인 성공');
              } catch (error) {
                print('카카오계정으로 로그인 실패 $error');
              }
            }
          },
        ),
      ),
    );
  }
}
