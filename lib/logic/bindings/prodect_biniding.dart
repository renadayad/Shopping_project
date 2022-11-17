import 'package:get/instance_manager.dart';
import 'package:shop_app/logic/controllers/cart_controllers.dart';
import 'package:shop_app/logic/controllers/category_controller.dart';
import 'package:shop_app/logic/controllers/prodect_controllers.dart';

class ProdectBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProdectController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
