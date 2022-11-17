import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/prodect_controllers.dart';
import 'package:shop_app/utils/text_utils.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/Home/card_item.dart';
import 'package:shop_app/view/widgets/Home/search_text_form.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // final controller = Get.find<ProdectController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TextUtils(
                  //     text: "",
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //     fontsize: 25,
                  //     underLine: TextDecoration.none),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // TextUtils(
                  //     text: "",
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //     fontsize: 28,
                  //     underLine: TextDecoration.none),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  SizedBox(
                    height: 53,
                  ),
                  SearchText(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                  text: "Categories",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontsize: 20,
                  underLine: TextDecoration.none),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CardItems(),
        ],
      ),
    ));
  }
}
