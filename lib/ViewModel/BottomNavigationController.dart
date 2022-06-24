import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxService{
  static BottomNavigationController get to => Get.find();
  RxInt currentIndex = 1.obs;

  void changePageIndex(int index){
    currentIndex(index);
  }
}

class clientController extends GetxService{
  static clientController get to => Get.find();
  RxString email = "".obs;
  RxString pw = "".obs;
  RxString name = "".obs;
  RxString style = "".obs;
  RxString gender = "".obs;
  RxString weather = "".obs;
  RxString temp = "".obs;
  RxString location1 = "".obs;
  RxString location2 = "".obs;
  RxString situation = "일상".obs;
  RxString time = "".obs;

  void changeEmail(String index){
    email(index);
  }
  void changeLocation1(String index){
    location1(index);
  }
  void changeLocation2(String index){
    location2(index);
  }
  void changePw(String index){
    pw(index);
  }
  void changeName(String index){
    name(index);
  }

  void changeStyle(String index){
    style(index);
  }

  void changeGender(String index){
    gender(index);
  }

  void changeWeather(String index){
    weather(index);
  }

  void changetemp(String index){
    temp(index);
  }

  void changesituation(String index){
    situation(index);
  }

  void changeTime(String index){
    time(index);
  }

}