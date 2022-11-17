import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controllers.dart';
import 'package:shop_app/logic/controllers/them_controllers.dart';
import 'package:shop_app/utils/text_utils.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/Setting/dark_mode_widget.dart';
import 'package:shop_app/view/widgets/Setting/language_widget.dart';
import 'package:shop_app/view/widgets/Setting/logout_widget.dart';
import 'package:shop_app/view/widgets/Setting/profile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // ProfileWidget(),
          TextUtils(
            fontsize: 18,
            fontWeight: FontWeight.bold,
            text: "Setting".tr,
            color: Get.isDarkMode ? pinkClr : mainColor,
            underLine: TextDecoration.none,
          ),
          // Divider(
          //   color: Get.isDarkMode ? Colors.white : Colors.grey,
          //   thickness: 2,
          // ),

          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}



      // body: Center(
      //   child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //     TextButton(
      //       onPressed: () {
      //         Them_Controllers().changethem();
      //       },
      //       child: Text(
      //         "Dark Mode",
      //         style: TextStyle(
      //             color: Get.isDarkMode ? Colors.white : Colors.black),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 20,
      //     ),
      //     GetBuilder<AuthController>(builder: (controller) {
      //       return TextButton(
      //         onPressed: () {
      //           Get.defaultDialog(
      //             title: "Logout From App",
      //             titleStyle: TextStyle(
      //                 fontSize: 10,
      //                 color: Colors.black,
      //                 fontWeight: FontWeight.bold),
      //             middleText: 'Are you sure need to logout',
      //             middleTextStyle: TextStyle(
      //                 fontSize: 10,
      //                 color: Colors.black,
      //                 fontWeight: FontWeight.bold),
      //             backgroundColor: Colors.grey,
      //             radius: 10,
      //             textCancel: "No",
      //             cancelTextColor: Colors.white,
      //             textConfirm: "Yes",
      //             confirmTextColor: Colors.white,
      //             onCancel: () {
      //               Get.back();
      //             },
      //             onConfirm: () {
      //               controller.signOutFromApp();
      //             },
      //             buttonColor: Get.isDarkMode ? pinkClr : mainColor,
      //           );
      //           // controller.signOutFromApp();
      //         },
      //         child: Text(
      //           "LogOut",
      //           style: TextStyle(
      //               color: Get.isDarkMode ? Colors.white : Colors.black),
      //         ),
      //       );
      //     })
      //   ]),
      // ),
    
