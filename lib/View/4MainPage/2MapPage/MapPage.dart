import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:wearther/View/3InitialChoosePage/styleChooseButton.dart';
import 'package:wearther/View/3InitialChoosePage/genderChooseButton.dart';
import 'package:wearther/View/3InitialChoosePage/DropDownItems.dart';
import 'package:wearther/View/4MainPage/2MapPage/situationButton.dart';
import 'package:wearther/View/4MainPage/2MapPage/timeButton.dart';
import 'package:wearther/ViewModel/BottomNavigationController.dart';


class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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
                            case "부산광역시":
                              return Si_menu[1];
                            case "대구광역시":
                              return Si_menu[2];
                            case "인천광역시":
                              return Si_menu[3];
                            case "광주광역시":
                              return Si_menu[4];
                            case "대전광역시":
                              return Si_menu[5];
                            case "울산광역시":
                              return Si_menu[6];
                            case "세종특별자치시":
                              return Si_menu[7];
                            case "경기도":
                              return Si_menu[8];
                            case "강원도":
                              return Si_menu[9];
                            case "충청북도":
                              return Si_menu[10];
                            case "충청남도":
                              return Si_menu[11];
                            case "전라북도":
                              return Si_menu[12];
                            case "전라남도":
                              return Si_menu[13];
                            case "경상북도":
                              return Si_menu[14];
                            case "경상남도":
                              return Si_menu[15];
                            case "제주특별자치도":
                              return Si_menu[16];
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

            Text("활동 시간대", style: TextStyle(
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
                        timeButton(text: "오전"),
                        timeButton(text: "오후"),
                        timeButton(text: "정오"),
                      ],
                    ),
                  ],
                )
            ),

            Text("활동내용", style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black
            ),),
            SizedBox(height: 10.h,),
            Container(
                width: 280.w, height: 180.h,
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
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            situationButton(text: "학교"),
                            situationButton(text: "일상"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            situationButton(text: "데이트"),
                            situationButton(text: "공적"),
                          ],
                        ),
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
                  clientController.to.location1(dropDownValue_Do);
                  clientController.to.location2(dropDownValue_Si);

                  BottomNavigationController.to.currentIndex(1);
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