import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wearther/View/3InitialChoosePage/InitialChoosePage.dart';
import 'package:get/get.dart';
import 'package:wearther/ViewModel/clientController.dart';

class genderChooseButton extends StatelessWidget {
  genderChooseButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.w),
        child: Obx(
          () => ElevatedButton(
            onPressed: (){
              clientController.to.gender(text);
            },
            style: ElevatedButton.styleFrom(
              elevation: ifChosen() ? 0.0 : 5.0,
              primary: ifChosen() ? Color(0xFF5E69C4) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            child: Text(text, style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: ifChosen() ? Colors.white : Color(0xFF5E69C4),
            ),),
          ),
        )
    );
  }

  bool ifChosen(){
    return clientController.to.gender.value.compareTo(text) == 0;
  }
}
