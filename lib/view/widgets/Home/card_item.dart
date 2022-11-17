import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/cart_controllers.dart';
import 'package:shop_app/logic/controllers/prodect_controllers.dart';
import 'package:shop_app/model/prodect_models.dart';
import 'package:shop_app/utils/text_utils.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/screens/prodect_screen.dart';

class CardItems extends StatelessWidget {
  CardItems({super.key});
  final controller = Get.find<ProdectController>();

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoding.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchTextController.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset("assets/images/search_empty_dark.png")
                  : Image.asset("assets/images/search_empry_light.png")
              : GridView.builder(
                  itemCount: controller.searchList.isEmpty
                      ? controller.prodectList.length
                      : controller.searchList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    if (controller.searchList.isEmpty) {
                      return buildCardItems(
                          image: controller.prodectList[index].image,
                          price: controller.prodectList[index].price,
                          rate: controller.prodectList[index].rating.rate,
                          productId: controller.prodectList[index].id,
                          productModels: controller.prodectList[index],
                          onTap: () {
                            Get.to(() => Prodect_Screen(
                                  productModels: controller.prodectList[index],
                                ));
                          });
                    } else {
                      return buildCardItems(
                          image: controller.searchList[index].image,
                          price: controller.searchList[index].price,
                          rate: controller.searchList[index].rating.rate,
                          productId: controller.searchList[index].id,
                          productModels: controller.searchList[index],
                          onTap: () {
                            Get.to(() => Prodect_Screen(
                                  productModels: controller.searchList[index],
                                ));
                          });
                    }
                  },
                ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProdectModel productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavourites(productId);
                      },
                      icon: controller.isFavourites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Container(
                    //   height: 20,
                    //   width: 45,
                    //   decoration: BoxDecoration(
                    //     color: mainColor,
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    // child: Padding(
                    //   padding: const EdgeInsets.only(left: 3, right: 2),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       TextUtils(
                    //         fontsize: 13,
                    //         fontWeight: FontWeight.bold,
                    //         text: "$rate",
                    //         color: Colors.white,
                    //         underLine: TextDecoration.none,
                    //       ),
                    //       const Icon(
                    //         Icons.star,
                    //         size: 13,
                    //         color: Colors.white,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
