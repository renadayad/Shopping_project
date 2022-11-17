import 'package:get/instance_manager.dart';
import 'package:shop_app/logic/controllers/auth_controllers.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
  }
}
