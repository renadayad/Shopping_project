import 'package:get/get.dart';
import 'package:shop_app/view/screens/category_screen.dart';
import 'package:shop_app/view/screens/favorites_screen.dart';
import 'package:shop_app/view/screens/home_screen.dart';
import 'package:shop_app/view/screens/setting_screen.dart';

class MainControllre extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs =
      [HomeScreen(), CategoryScreen(), FavoritesScreen(), SettingScreen()].obs;

  final title = ['online shoo', 'category', 'favorites', 'setting'].obs;
}
