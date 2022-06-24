import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wearther/ViewModel/BottomNavigationController.dart';

class userInfoPage extends StatefulWidget {
  @override
  _userInfoPageState createState() => _userInfoPageState();
}
var email = '';
bool checked = false;
class _userInfoPageState extends State<userInfoPage> {
  final _registerkey = GlobalKey<FormState>();
  final _registerIdController = TextEditingController();
  final _registerPWController = TextEditingController();
  final _pwCheckController = TextEditingController();
  final _nicknameController = TextEditingController();
  @override
  void dispose() {
    _registerIdController.dispose();
    _registerPWController.dispose();
    _pwCheckController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 800),
        builder: (BuildContext context, Widget? child) {
          return Scaffold(

            appBar: AppBar(leading: IconButton(
              icon: Icon(Icons.backspace),
              onPressed: () => Navigator.pop(context),),
              title: Text('Sign Up'),
              centerTitle: true,
            ),
            body:
            Form(
              key: _registerkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        width: 230,
                        height: 110,
                        child: TextFormField(
                          controller: _registerIdController,
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .length < 1) {
                              return 'Input ID';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            hintText: 'ID ',
                          ),

                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 120,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () async {
                              var url = Uri.parse(
                                  'http://115.85.182.148:9001/api/id_check.php?member_id=${_registerIdController.text}');
                              var response = await http.get(url);

                              Map<String,dynamic> data = jsonDecode(response.body);
                              bool check = data["already"];
                              if (check){
                                flutterToast('이미 있는 이름입니다!');
                                _registerIdController.text = '';
                                checked = false;
                              } else {
                                flutterToast('사용할 수 있는 이름입니다!');
                                email = _registerIdController.text;
                                checked = true;
                              }
                            },
                            child: Text('중복 검사')),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 5.0),
                      Container(
                        width: 375,
                        child: TextFormField(
                          controller: _nicknameController,
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .length < 1) {
                              return 'Input PassWord';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            hintText: 'Nickname',
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        width: 375,
                        child: TextFormField(
                          controller: _registerPWController,
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .length < 1) {
                              return 'Input PassWord';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            hintText: 'PassWord',
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        width: 375,
                        child: TextFormField(
                          controller: _pwCheckController,
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .length < 1) {
                              return 'Repeat PassWord!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            hintText: 'Repeat Password',
                          ),
                          obscureText: true,
                          /*onChanged: (value) =>
                          if (value.text == _registerPWController.text){

                          },*/
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Center(
                      child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (_pwCheckController.text ==
                                    _registerPWController.text &&
                                    _registerIdController.text.isNotEmpty
                                    && _registerPWController.text.isNotEmpty &&
                                    _pwCheckController.text.isNotEmpty) {
                                  if (checked) {
                                    flutterToast('Sign in Complete!');

                                    clientController.to.changeName(_nicknameController.text);
                                    clientController.to.changeEmail(_registerIdController.text);
                                    clientController.to.changePw(_pwCheckController.text);
                                    Get.toNamed('/InitChoose');
                                  } else {
                                    flutterToast('Sign in Failed!');
                                  }
                                }
                              }, child: Text('Sign In'),
                            )
                          ]
                      ),
                    ),
                  ),
                  SizedBox(height: 130,),
                ],
              ),
            ),
          );
        }
    );
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