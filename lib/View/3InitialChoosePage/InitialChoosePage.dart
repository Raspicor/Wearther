import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wearther/ViewModel/BottomNavigationController.dart';
import 'package:wearther/View/3InitialChoosePage/styleChooseButton.dart';
import 'package:wearther/View/3InitialChoosePage/genderChooseButton.dart';
import '../2LoginPage/logInPage.dart';
import 'DropDownItems.dart';
import 'package:http/http.dart' as http;


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
    return Flexible(
      child: Scaffold(
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
                  width: 280.w,
                  height: 100.h,
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
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(Icons.arrow_circle_down_sharp,
                                color: Color(0xFF5E69C4),
                              )
                          ),
                          iconEnabledColor: Colors.white,
                          //Icon color
                          style: TextStyle( //te
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
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(Icons.arrow_circle_down_sharp,
                                color: Color(0xFF5E69C4),
                              )
                          ),
                          iconEnabledColor: Colors.white,
                          //Icon color
                          style: TextStyle( //te
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
                  width: 280.w,
                  height: 200.h,
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
                  onPressed: () async {
                    clientController.to.changeLocation1(dropDownValue_Do);

                    if(clientController.to.gender.value.compareTo("남성") == 0)
                      clientController.to.gender("남");
                    if(clientController.to.gender.value.compareTo("여성") == 0)
                      clientController.to.gender("여");

                    String email = clientController.to.email.value.toString();
                    String pw = clientController.to.pw.value.toString();
                    String style = clientController.to.style.value.toString();
                    String name = clientController.to.name.value.toString();
                    String location = clientController.to.location1.value.toString();
                    print('-------------------------------------------------------------------------\n'
                        'Hackakakk : ${email}:${pw}:${style}:${name}:${location}'
                        '\n-------------------------------------------------------------------------');
                    var url = Uri.parse(
                        'http://115.85.182.148:9001/api/member_create.php');
                    var body = json.encode({
                      'member_id': email,
                      'member_password': pw,
                      'member_favorite_style': style,
                      'member_nickname': name,
                      'location_name': location,
                      'member_gender': clientController.to.gender.value
                    });

                    var response = await http.post(url, headers: {
                      "Content-Type": "application/json"
                    },

                        body: body
                    );

                    if (response.statusCode != 200) {
                      flutterToast('Please Retry.');
                      return null;
                    } else
                      Get.toNamed('/Main');
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
      ),
    );
  }
}
class StyleButtonController extends GetxService{
  static StyleButtonController get to => Get.find();
  RxString chosenStyle = "".obs;

  void changeChosenStyle(String index){
    chosenStyle(index);
  }
}