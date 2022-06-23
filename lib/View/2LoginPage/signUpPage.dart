import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wearther/View/2LoginPage/userInfoPage.dart';

class signUpPage extends StatefulWidget {
  @override
  _singUpPageState createState() => _singUpPageState();
}

class _singUpPageState extends State<signUpPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,800),
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar : AppBar( leading: IconButton(icon : Icon(Icons.backspace),  onPressed: () => Navigator.pop(context),),
              centerTitle: true,
              title: Text('Sign Up', style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          body: Center(
              child : Container(
                height : 400,
                child : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  CupertinoButton(child: Text('이메일 회원가입', ),
                      color: Colors.indigoAccent,
                      onPressed: () async{
                        await _userInfoPage(context);
                    }
                  ),
                  CupertinoButton(child: Text('카카오 회원가입', ),
                      color: Colors.yellow,
                      onPressed: (){
                        //go To KaKao Form
                      }),
                ],
                ),
            ),
          ),
        );
      }
    );
  }
  Future<void> _userInfoPage(BuildContext context) async {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => userInfoPage()),);
  }
}


