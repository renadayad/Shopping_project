import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controllers.dart';
import 'package:shop_app/utils/text_utils.dart';
import 'package:shop_app/utils/theme.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.CheckBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                      ? Image.asset('assets/images/check.png')
                      : Icon(
                          Icons.done,
                          color: pinkClr,
                        )
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                  text: "I accept ",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.normal,
                  fontsize: 16,
                  underLine: TextDecoration.none),
              TextUtils(
                  text: " terms & conditions ",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.normal,
                  fontsize: 16,
                  underLine: TextDecoration.none)
            ],
          )
        ],
      );
    });
  }
}
