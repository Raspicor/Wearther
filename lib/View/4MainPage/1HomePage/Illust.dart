import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wearther/ViewModel/BottomNavigationController.dart';


class Illust extends StatelessWidget {

  Illust({
    Key? key,
    required this.shoeType,
    required this.shoeName,
    required this.pantsType,
    required this.pantsName,
    required this.topType,
    required this.topName,
    required this.outerType,
    required this.outerName,
    required this.accesariesType,
    required this.accesariesName,

  }) : super(key: key);

  String shoeType;
  String shoeName;
  String pantsType;
  String pantsName;
  String topType;
  String topName;
  String outerType;
  String outerName;
  String accesariesType;
  String accesariesName;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 180.h,
      width: context.width*0.7,
      child: Stack(
        children: [
          Image.asset(
            'assets/IllustImage/body/woman.png',
          ),
          Image.asset(
            'assets/IllustImage/clothings/신발/${shoeType}/${shoeName}_${colors[Random().nextInt(6)]}.png',
          ),
          Image.asset(
            'assets/IllustImage/clothings/하의/${pantsType}/${pantsName}_${colors[Random().nextInt(6)]}.png',
          ),
          Image.asset(
            'assets/IllustImage/clothings/상의/${topType}/${topName}_${colors[Random().nextInt(6)]}.png',
          ),
          Image.asset(
            'assets/IllustImage/clothings/아우터/${outerType}/${outerName}_${colors[Random().nextInt(6)]}.png',
          ),
          Image.asset(
            'assets/IllustImage/clothings/기타/${accesariesType}/${accesariesName}_${colors[Random().nextInt(6)]}.png',
          ),
        ],
      ),
    );
  }
}


class IllustContent extends StatefulWidget {
  const IllustContent({Key? key}) : super(key: key);

  @override
  State<IllustContent> createState() => _IllustContentState();
}

class _IllustContentState extends State<IllustContent> {
  late List<List<String>> clothes = [];
  dynamic parsingData = null;

  var ifExists = [
    true,
    true,
    true,
    true,
    true,
  ];

  @override
  void initState() {
    loadData();
  }

  void loadData() async{
    var url = Uri.parse(
        "http://115.85.182.148:9001/api/calculate.php?style=${clientController.to.style.value}&gender=${clientController.to.gender.value}&weather=${"흐림"}&temp=${"15"}&situation=${clientController.to.situation.value}");

    
    var response = await http.get(url);

    setState(() {
      parsingData = json.decode(response.body);
      print(parsingData.toString());
      print("성공 ㅠㅠㅠㅠㅠㅠ");

      if(parsingData[0][0]["clothes_name"].toString().compareTo("원피스") == 0)
        ifExists[1] = false;
      else
        ifExists[1] = true;


      if(parsingData[0][0]["clothes_name"].toString().compareTo("temp") == 0)
        ifExists[0] = false;
      else
        ifExists[0] = true;

      if(parsingData[1][0]["clothes_name"].toString().compareTo("temp") == 0)
        ifExists[1] = false;
      else
        ifExists[1] = true;

      if(parsingData[2][0]["clothes_name"].toString().compareTo("temp") == 0)
        ifExists[2] = false;
      else
        ifExists[2] = true;

      if(parsingData[3][0]["clothes_name"].toString().compareTo("temp") == 0)
        ifExists[3] = false;
      else
        ifExists[3] = true;

      if(parsingData[4][0]["clothes_name"].toString().compareTo("temp") == 0)
        ifExists[4] = false;
      else
        ifExists[4] = true;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: parsingData == null ? SpinKitCircle(
          color: Colors.black,
          size: 80.0,
        ) : Illust(
            shoeType: !ifExists[4] ? "blank" : "${parsingData[4][0]["clothes_detailtype"]}",
            shoeName: !ifExists[4] ? "blank" : "${parsingData[4][0]["clothes_name"]}",
            pantsType: !ifExists[1] ? "blank" : "${parsingData[1][0]["clothes_detailtype"]}",
            pantsName: !ifExists[1] ? "blank" : "${parsingData[1][0]["clothes_name"]}",
            topType: !ifExists[0] ? "blank" : "${parsingData[0][0]["clothes_detailtype"]}",
            topName: !ifExists[0] ? "blank" : "${parsingData[0][0]["clothes_name"]}",
            outerType: !ifExists[2] ? "blank" : "${parsingData[2][0]["clothes_detailtype"]}",
            outerName: !ifExists[2] ? "blank" : "${parsingData[2][0]["clothes_name"]}",
            accesariesType: !ifExists[3] ? "blank" : "${parsingData[3][0]["clothes_detailtype"]}",
            accesariesName: !ifExists[3] ? "blank" : "${parsingData[3][0]["clothes_name"]}"
        )
    );
  }
}

var colors = [
  "흰색",
  "검은색",
  "베이지색",
  "하늘색",
  "회색",
  "빨간색"
];
