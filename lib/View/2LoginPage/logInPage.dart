import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:wearther/View/2LoginPage/signUpPage.dart';

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
            SizedBox(height: 280.0),
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
                    ],  
                  )
                ),
                CupertinoButton(
                  child: Text('Log In'),
                  onPressed: () {
                    if(_formkey.currentState!.validate()) {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => main()),
                      );
                    } */ // home page넣고 주석 지우자
                    } // 중괄호는 냅둬
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => signUpPage()),);
  }
}