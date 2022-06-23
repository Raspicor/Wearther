import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wearther/View/MainPage/1HomePage/HomePage.dart';
import 'package:wearther/View/MainPage/2MapPage/MapPage.dart';
import 'package:wearther/View/MainPage/3CommunityPage/CommunityPage.dart';
import 'package:wearther/View/MainPage/4MyPage/MyPage.dart';

import '../../ViewModel/BottomNavigationController.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : (){
        switch(_selectedIndex){
          case 0:
            return HomePage();
          case 1:
            return MapPage();
          case 2:
            return CommunityPage();
          case 3:
            return MyPage();
        }
      }(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
            setState(() {
              _selectedIndex = 0;
            });
          }, icon: Icon(Icons.home)),

          IconButton(
            icon: Icon(Icons.map),
            onPressed: () async {
              setState(() {
                _selectedIndex = 1;
              });
//              await _openKakaoMapScreen(context);
            },
          ),

          IconButton(
            onPressed: (){
              setState(() {
                _selectedIndex = 2;
              });
            },
            icon: Icon(Icons.feed_outlined)
          ),

          IconButton(
            onPressed: (){
              setState(() {
                _selectedIndex = 3;
              });
            },
            icon: Icon(Icons.account_circle)
          ),
        ],
      ),
    );
  }

  // Future<void> _openKakaoMapScreen(BuildContext context) async {
  //   KakaoMapUtil util = KakaoMapUtil();
  //   String url = await util.getMapScreenURL(31.000000, 176.570667, name: 'Kakao 본사');
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (_) => KakaoMapScreen(url: url)));
  // }
}

