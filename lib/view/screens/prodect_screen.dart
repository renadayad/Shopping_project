import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/model/prodect_models.dart';
import 'package:shop_app/view/widgets/Prodect/add_cart.dart';
import 'package:shop_app/view/widgets/Prodect/clothes_info.dart';
import 'package:shop_app/view/widgets/Prodect/image_sliders.dart';
import 'package:shop_app/view/widgets/Prodect/size_list.dart';

class Prodect_Screen extends StatelessWidget {
  final ProdectModel productModels;

  const Prodect_Screen({required this.productModels, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productModels.image,
              ),
              ClothesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
              const SizeList(),
              SizedBox(
                height: 20,
              ),
              AddCart(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
