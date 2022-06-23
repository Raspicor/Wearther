import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxService{
  static BottomNavigationController get to => Get.find();
  RxInt currentIndex = 1.obs;

  void changePageIndex(int index){
    currentIndex(index);
  }
}