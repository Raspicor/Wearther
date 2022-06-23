import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(20.w),
            padding : EdgeInsets.all(20.w),
            child: Image.asset('assets/LoadingImage/R.png', width: 350.w, height: 350.h) // 추천 일러스트 이미지
        ),
        Divider(thickness: 2),//
        Text('', style: TextStyle(
            fontSize: 10)
        ),
        Text('마음에 들지 않으시다면',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black
          ),
        ),
        Text('', style: TextStyle(
            fontSize: 10)
        ),

        Container(
          child : Column(
            children: [
              Text('이런 상의는 어떠세요?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container( //Row로 바꾸고 이미지 넣기
                  height: 100.h,
                  child : Text('상의들')
              )
            ],
          ),
        ),

        Container(
            child: Column(
              children: [
                Text('이런 하의는 어떠세요?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                Container( //Row로 바꾸고 이미지 넣기
                    height: 100.h,
                    child : Text('하의들')
                )
              ],
            )
        ),

        Container(
          child: Column(
            children: [
              Text('이런 스타일은 어떠세요?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container( //Row로 바꾸고 이미지 넣기
                height: 100.h,
                child : Text('사용자가 고르지 않은 스타일')
              )
            ],
          )
        ),
      ],
    );
  }
}
