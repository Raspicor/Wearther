import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> Do_menu = [
  DropdownMenuItem(child: Text("시/도 선택"), value: "시/도 선택",),
  DropdownMenuItem(child: Text("서울특별시"), value: "서울특별시",),
  DropdownMenuItem(child: Text("대구광역시"), value: "대구광역시",),
  DropdownMenuItem(child: Text("부산광역시"), value: "부산광역시",),
  DropdownMenuItem(child: Text("인천광역시"), value: "인천광역시",),
  DropdownMenuItem(child: Text("대전광역시"), value: "대전광역시",),
  DropdownMenuItem(child: Text("광주광역시"), value: "광주광역시",),
  DropdownMenuItem(child: Text("울산광역시"), value: "울산광역시",),
  DropdownMenuItem(child: Text("세종특별자치시"), value: "세종특별자치시",),
  DropdownMenuItem(child: Text("경기도"), value: "경기도",),
  DropdownMenuItem(child: Text("강원도"), value: "강원도",),
  DropdownMenuItem(child: Text("충청북도"), value: "충청북도",),
  DropdownMenuItem(child: Text("충청남도"), value: "충청남도",),
  DropdownMenuItem(child: Text("전라북도"), value: "전라북도",),
  DropdownMenuItem(child: Text("전라남도"), value: "전라남도",),
  DropdownMenuItem(child: Text("경상북도"), value: "경상북도",),
  DropdownMenuItem(child: Text("경상남도"), value: "경상남도",),
  DropdownMenuItem(child: Text("제주특별자치도"), value: "제주특별자치도",)
];

List<List<DropdownMenuItem<String>>> Si_menu = [

  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("마포구"), value: "마포구",),
    DropdownMenuItem(child: Text("노량진구"), value: "노량진구",),
    DropdownMenuItem(child: Text("종로구"), value: "종로구",),
    DropdownMenuItem(child: Text("동대문구"), value: "동대문구",),
    DropdownMenuItem(child: Text("노원구"), value: "노원구",),
    DropdownMenuItem(child: Text("구로구"), value: "구로구",),
    DropdownMenuItem(child: Text("서대문구"), value: "서대문구",),
    DropdownMenuItem(child: Text("관악구"), value: "관악구",),
    DropdownMenuItem(child: Text("영등포구"), value: "영등포구",),
    DropdownMenuItem(child: Text("강남구"), value: "강남구",),
  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("중구"), value: "중구",),
    DropdownMenuItem(child: Text("서구"), value: "서구",),
    DropdownMenuItem(child: Text("동구"), value: "동구",),
    DropdownMenuItem(child: Text("동래구"), value: "동래구",),
    DropdownMenuItem(child: Text("남구"), value: "남구",),
    DropdownMenuItem(child: Text("북구"), value: "북구",),
    DropdownMenuItem(child: Text("해운대구"), value: "해운대구",),

  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("중구"), value: "중구",),
    DropdownMenuItem(child: Text("서구"), value: "서구",),
    DropdownMenuItem(child: Text("동구"), value: "동구",),
    DropdownMenuItem(child: Text("남구"), value: "남구",),
    DropdownMenuItem(child: Text("북구"), value: "북구",),
    DropdownMenuItem(child: Text("수성구"), value: "수성구",),
    DropdownMenuItem(child: Text("달서구"), value: "달서구",),

  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("중구"), value: "중구",),
    DropdownMenuItem(child: Text("서구"), value: "서구",),
    DropdownMenuItem(child: Text("동구"), value: "동구",),
    DropdownMenuItem(child: Text("미추홀구"), value: "미추홀구",),
    DropdownMenuItem(child: Text("부평구"), value: "부평구",),
    DropdownMenuItem(child: Text("강화군"), value: "강화군",),
    DropdownMenuItem(child: Text("계양구"), value: "계양구",),

  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("서구"), value: "서구",),
    DropdownMenuItem(child: Text("동구"), value: "동구",),
    DropdownMenuItem(child: Text("남구"), value: "남구",),
    DropdownMenuItem(child: Text("북구"), value: "북구",),
    DropdownMenuItem(child: Text("광산구"), value: "광산구",),

  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("서구"), value: "서구",),
    DropdownMenuItem(child: Text("동구"), value: "동구",),
    DropdownMenuItem(child: Text("중구"), value: "중구",),
    DropdownMenuItem(child: Text("유성구"), value: "유성구",),
    DropdownMenuItem(child: Text("대덕구"), value: "대덕구",),

  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("남구"), value: "남구",),
    DropdownMenuItem(child: Text("동구"), value: "동구",),
    DropdownMenuItem(child: Text("중구"), value: "중구",),
    DropdownMenuItem(child: Text("북구"), value: "북구",),

  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("금남면"), value: "금남면",),
    DropdownMenuItem(child: Text("부강면"), value: "부강면",),
    DropdownMenuItem(child: Text("소정면"), value: "소정면",),
    DropdownMenuItem(child: Text("연기면"), value: "연기면",),

  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("수원시"), value: "수원시",),
    DropdownMenuItem(child: Text("성남시"), value: "성남시",),
    DropdownMenuItem(child: Text("의정부시"), value: "의정부시",),
    DropdownMenuItem(child: Text("안양시"), value: "안양시",),

  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("춘천시"), value: "춘천시",),
    DropdownMenuItem(child: Text("원주시"), value: "원주시",),
    DropdownMenuItem(child: Text("강릉시"), value: "강릉시",),
    DropdownMenuItem(child: Text("동해시"), value: "동해시",),

  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("청주시"), value: "청주시",),
    DropdownMenuItem(child: Text("충주시"), value: "충주시",),
    DropdownMenuItem(child: Text("제천시"), value: "제천시",),
  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("천안시"), value: "천안시",),
    DropdownMenuItem(child: Text("공주시"), value: "공주시",),
    DropdownMenuItem(child: Text("보령시"), value: "아산시",),
  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("전주시"), value: "전주시",),
    DropdownMenuItem(child: Text("군산시"), value: "익산시",),
    DropdownMenuItem(child: Text("정읍시"), value: "정읍시",),
  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("목포시"), value: "목포시",),
    DropdownMenuItem(child: Text("여수시"), value: "여수시",),
    DropdownMenuItem(child: Text("순천시"), value: "순천시",),
    DropdownMenuItem(child: Text("나주시"), value: "나주시",),
    DropdownMenuItem(child: Text("광양시"), value: "광양시",),
  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("포항시"), value: "포항시",),
    DropdownMenuItem(child: Text("경주시"), value: "경주시",),
    DropdownMenuItem(child: Text("김천시"), value: "김천시",),
    DropdownMenuItem(child: Text("안동시"), value: "안동시",),
    DropdownMenuItem(child: Text("구미시"), value: "구미시",),
  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("창원시"), value: "창원시",),
    DropdownMenuItem(child: Text("진주시"), value: "진주시",),
    DropdownMenuItem(child: Text("통영시"), value: "통영시",),
    DropdownMenuItem(child: Text("사천시"), value: "사천시",),
    DropdownMenuItem(child: Text("김해시"), value: "김해시",),
  ],
  [
    DropdownMenuItem(child: Text("시/구 선택"), value: "시/구 선택",),
    DropdownMenuItem(child: Text("제주시"), value: "제주시",),
    DropdownMenuItem(child: Text("서귀포시"), value: "서귀포시",)
  ]
];