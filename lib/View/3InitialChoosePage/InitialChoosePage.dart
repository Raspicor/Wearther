import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:wearther/View/3InitialChoosePage/styleChooseButton.dart';
import 'package:wearther/View/3InitialChoosePage/genderChooseButton.dart';
import 'DropDownItems.dart';

class InitialChoosePage extends StatefulWidget {
  const InitialChoosePage({Key? key}) : super(key: key);

  @override
  State<InitialChoosePage> createState() => _InitialChoosePageState();
}

class _InitialChoosePageState extends State<InitialChoosePage> {
  String dropDownValue_Do = "시/도 선택";
  String dropDownValue_Si = "시/구 선택";
  String chosenStyle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(40.w, 50.h, 40.w, 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("성별", style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black
            ),),
            SizedBox(height: 10.h,),
            Container(
                width: 280.w, height: 100.h,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: const Color(0xFF5E69C4),
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0.w)
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        genderChooseButton(text: "남성"),
                        genderChooseButton(text: "여성"),
                      ],
                    ),
                  ],
                )
            ),

            SizedBox(height: 30.h,),
            Text("거주지역", style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
            ),),
            SizedBox(height: 10.h,),
            Container(
              width: 280.w,
              decoration: BoxDecoration(
                  color: const Color(0xFF5E69C4),
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0.w)
                  )
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(30.0.w)
                        )
                    ),
                    child: DropdownButton(
                      value: dropDownValue_Do,
                      items: Do_menu,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue_Do = newValue!;
                        });
                      },
                      icon: Padding( //Icon at tail, arrow bottom is default icon
                          padding: EdgeInsets.only(left:20),
                          child:Icon(Icons.arrow_circle_down_sharp,
                            color: Color(0xFF5E69C4),
                          )
                      ),
                      iconEnabledColor: Colors.white, //Icon color
                      style: TextStyle(  //te
                          color: Color(0xFF5E69C4), //Font color
                          fontSize: 20 //font size on dropdown button
                      ),
                      dropdownColor: Colors.white,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(30.0.w)
                        )
                    ),
                    child: DropdownButton(
                      value: dropDownValue_Si,
                      items: () {
                        switch (dropDownValue_Do) {
                          case "서울특별시":
                            return Si_menu[0];
                        }
                      }(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue_Si = newValue!;
                        });
                      },
                      icon: Padding( //Icon at tail, arrow bottom is default icon
                          padding: EdgeInsets.only(left:20),
                          child:Icon(Icons.arrow_circle_down_sharp,
                            color: Color(0xFF5E69C4),
                          )
                      ),
                      iconEnabledColor: Colors.white, //Icon color
                      style: TextStyle(  //te
                          color: Color(0xFF5E69C4), //Font color
                          fontSize: 20 //font size on dropdown button
                      ),
                      dropdownColor: Colors.white,
                    ),
                  ),

                ],
              )
            ),

            SizedBox(height: 30.h,),
            Text("스타일", style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black
            ),),
            SizedBox(height: 10.h,),
            Container(
                width: 280.w, height: 200.h,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: const Color(0xFF5E69C4),
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0.w)
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        styleChooseButton(text: "캐주얼"),
                        styleChooseButton(text: "모던"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        styleChooseButton(text: "포멀"),
                        styleChooseButton(text: "스트릿"),
                      ],
                    ),
                  ],
                )
            ),
            SizedBox(height: 30.h,),
            Container(
              padding: EdgeInsets.fromLTRB(50.w, 0, 50.w, 0),
              width: context.width,
              child: ElevatedButton(
                onPressed: (){

                },
                child: Text("확인"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5E69C4),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}