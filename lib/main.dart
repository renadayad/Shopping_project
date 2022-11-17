import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/language/localiztion.dart';
import 'package:shop_app/logic/controllers/them_controllers.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/my_string.dart';
import 'package:shop_app/utils/theme.dart';
// import 'package:shop_app/view/screens/welcome-screens.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'my shop',
        debugShowCheckedModeBanner: false,
        locale: Locale(GetStorage().read<String>('lang').toString()),
        translations: LocaliztionApp(),
        fallbackLocale: Locale(ene),
        theme: ThemesApp.light,
        darkTheme: ThemesApp.dark,
        themeMode: Them_Controllers().themDataGet,
        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>("auth") == true
            ? AppRoutes.mainScreen
            : AppRoutes.welcome,
        getPages: AppRoutes.routes);
  }
}
