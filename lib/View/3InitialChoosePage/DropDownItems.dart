import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> Do_menu = [
  DropdownMenuItem(child: Text("시/도 선택"), value: "시/도 선택",),
  DropdownMenuItem(child: Text("서울특별시"), value: "서울특별시",),
  DropdownMenuItem(child: Text("대구광역시"), value: "대구광역시",),
];

List<DropdownMenuItem<String>> Si_menu = [
  DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
  DropdownMenuItem(child: Text("마포구"), value: "마포구",),
  DropdownMenuItem(child: Text("노량진구"), value: "노량진구",),
];
