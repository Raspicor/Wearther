import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('코디 갤러리', style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Color(0xFF5E69C4),
        automaticallyImplyLeading: false,
      ),
      body: GridView.count(
        crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
        childAspectRatio: 1 / 1.4, //item 의 가로 1, 세로 2 의 비율
        mainAxisSpacing: 10, //수평 Padding
        crossAxisSpacing: 10, //수직 Padding
        children: List.generate(11, (index) {  //item 의 반목문 항목 형성
          return Container(
            color: Colors.lightGreen,
            child: Text(' Item : $index'),
          );
        }),
      ),
    );
  }
}
