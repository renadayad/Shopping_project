import 'package:get/instance_manager.dart';
import 'package:shop_app/logic/controllers/auth_controllers.dart';
import 'package:shop_app/logic/controllers/main_controllers.dart';
import 'package:shop_app/logic/controllers/settings_controoller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainControllre());
    Get.put(SettingController());
  }
}
