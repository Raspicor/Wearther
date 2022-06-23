import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.w),
      color: Colors.white,
      child: Column(
        children: [

          //옷장관리 부분
          Container(
            width: 279.w,
            height: 385.h,
            alignment: Alignment(0.0, 0.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(30.0.w)
              )
            ),
            child: Text("옷장관리"),
          ),
          SizedBox(height: 20.h,),
          //개인정보 설정
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 0.0
            ),
            child: Row(
              children: [
                Image.asset('assets/MyPageImage/settings.png',),
                SizedBox(width: 12.w,),
                Text("개인정보 설정", style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.black
                ),)
              ]
            ),
          ),
          SizedBox(height: 20.h,),
          //로그아웃
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0.0
            ),
            child: Row(
                children: [
                  Image.asset('assets/MyPageImage/logout.png',),
                  SizedBox(width: 12.w,),
                  Text("로그아웃", style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.black
                  ),)
                ]
            ),
          ),
          SizedBox(height: 20.h,),
          //회원탈퇴
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0.0
            ),
            child: Row(
                children: [
                  Image.asset('assets/MyPageImage/withdrawal.png',),
                  SizedBox(width: 12.w,),
                  Text("회원탈퇴", style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.black
                  ),)
                ]
            ),
          ),

        ],
      ),
    );
  }
}
