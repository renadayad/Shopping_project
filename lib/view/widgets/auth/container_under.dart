import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/utils/text_utils.dart';
import 'package:shop_app/utils/theme.dart';

class Container_Under extends StatelessWidget {
  final String text;
  final String typetext;
  final Function() onPressed;
  const Container_Under(
      {required this.text,
      required this.typetext,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? mainColor : pinkClr,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontsize: 20,
              underLine: TextDecoration.none),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                  text: typetext,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontsize: 20,
                  underLine: TextDecoration.none))
        ],
      ),
    );
  }
}
