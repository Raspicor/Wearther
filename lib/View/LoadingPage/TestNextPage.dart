import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TestNextPage extends StatelessWidget {
  const TestNextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "NextPage",
          style: TextStyle(
            fontSize: 50.w
          ),
        ),
      ),
    );
  }
}
