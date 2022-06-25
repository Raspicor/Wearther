import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;

class logInPage extends StatefulWidget {
  @override
  _logInPageState createState() => _logInPageState();
}

class _logInPageState extends State<logInPage> {
  bool _isChecked = false;
  final GlobalKey <FormState> _formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        key : _formkey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            SizedBox(height: 100.0),
            Column(
              children: <Widget>[
                Image.asset('assets/LoadingImage/R.png')
              ],
            ),
            SizedBox(height: 30.0),
            TextFormField(
              controller: _usernameController,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Input ID!';
                } return null;
              },
              decoration: InputDecoration(
                filled: true,
                labelText: 'ID',
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Input PassWord!';
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child : Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (value){
                            setState((){
                              _isChecked = value!;
                            });
                          },
                        ),
                        Text('자동 로그인'),
                        // DB에 저장된 사용자 ID PW 가져와서 AutoLogin 함수 만들어서 찾자
                      ],
                    )
                ),
                CupertinoButton(
                  child: Text('Log In'),
                  onPressed: () async {
                    var id = _usernameController.text;
                    var pw = _passwordController.text;
                    var url = Uri.parse(
                        'http://115.85.182.148:9001/api/member.php?member_id=${id}&member_password=${pw}');
                    var response = await http.get(url);
                    if(response.statusCode == 200) {
                      flutterToast('Log In Complete!');
                      Get.toNamed("/Main");
                    } else {
                      flutterToast('Log In Failed! Please retry.');
                      return null;
                    }
                  },
                ),
              ],
            ),
            TextButton(onPressed: () {
              // go to findPWPage
            }, child: Text('Forgot Password?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigoAccent,
                decoration: TextDecoration.underline,
              ),)),
            TextButton(onPressed: () async {
              await _openSignUpPage(context);
            }, child: Text('Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigoAccent,
                decoration: TextDecoration.underline,
              ),)),
            SizedBox(height:10),
            Divider(),
            SizedBox(height:10),
            Center(
              child: CupertinoButton(
                color: Colors.yellow,
                child: Text(
                  "카카오톡 로그인",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  if (await isKakaoTalkInstalled()) {
                    try {
                      await UserApi.instance.loginWithKakaoTalk();
                      print('카카오톡으로 로그인 성공');
                      Get.toNamed('/Recommend');
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
                        Get.toNamed('/Recommend');
                      } catch (error) {
                        print('카카오계정으로 로그인 실패 $error');
                      }
                    }
                  } else {
                    try {
                      await UserApi.instance.loginWithKakaoAccount();
                      //navigator.push(context) go To homePage
                    } catch (error) {
                      print('카카오계정으로 로그인 실패 $error');
                    }
                  }
                },
              ),
            ),
            SizedBox(height:20),
          ],
        ),
      ),
    );
  }
  Future<void> _openSignUpPage(BuildContext context) async {
    Get.toNamed("/SignUp");
  }
}
void flutterToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER, //토스트 메시지 위치 지정
      backgroundColor: Colors.redAccent, //토스트 메시지 배경색
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT); //토스트 메시지 지속시간
}