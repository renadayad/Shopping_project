import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/services/prodect_services.dart';
import 'package:shop_app/view/screens/favorites_screen.dart';

import '../../model/prodect_models.dart';

class ProdectController extends GetxController {
  var prodectList = <ProdectModel>[].obs;
  var favouritesList = <ProdectModel>[].obs;

  var isLoding = true.obs;
  var stoarge = GetStorage();
  // var isFavourites = false.obs;
  var searchList = <ProdectModel>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    List? storedShoppinga = stoarge.read<List>('isFavouritesList');
    if (storedShoppinga != null) {
      favouritesList =
          storedShoppinga.map((e) => ProdectModel.fromJson(e)).toList().obs;
    }

    getProdect();
  }

  void getProdect() async {
    var prodects = await ProdectServices.getProdect();

    try {
      isLoding(true);
      if (prodects.isNotEmpty) {
        prodectList.addAll(prodects);
      }
    } finally {
      isLoding(false);
    }
  }

  void manageFavourites(int prodectid) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == prodectid);
    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await stoarge.remove("isFavouritesList");
    } else {
      favouritesList
          .add(prodectList.firstWhere((element) => element.id == prodectid));
    }
    await stoarge.write("isFavouritesList", favouritesList);
  }

  bool isFavourites(int prodectid) {
    return favouritesList.any((element) => element.id == prodectid);
  }

  // void addFavourites() {
  //   isFavourites.value = !isFavourites.value;
  // }

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = prodectList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
