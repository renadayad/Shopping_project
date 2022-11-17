import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Them_Controllers {
  final GetStorage boxStorge = GetStorage();

  final key = 'isDarkModes';

  saveThemeDataInBox(bool isDark) {
    boxStorge.write(key, isDark);
  }

  bool getThemeDataFromBox() {
    return boxStorge.read<bool>(key) ?? false;
  }

  ThemeMode get themDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changethem() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBox(!getThemeDataFromBox());
    //   Get.isDarkMode
    //       ? Get.changeThemeMode(ThemeMode.light)
    //       : Get.changeThemeMode(ThemeMode.dark);
    // }
  }
}
