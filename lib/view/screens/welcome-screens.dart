import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/text_utils.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:get/get.dart';
import 'package:shop_app/view/screens/auth/login_screen.dart';
import 'package:shop_app/view/screens/auth/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/s.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.3),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 190,
              ),
              Container(
                height: 60,
                width: 190,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: TextUtils(
                      text: 'Welcome',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontsize: 35,
                      underLine: TextDecoration.none),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 60,
                width: 190,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                        text: 'online',
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontsize: 35,
                        underLine: TextDecoration.none),
                    const SizedBox(width: 9),
                    TextUtils(
                        text: 'shop',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontsize: 35,
                        underLine: TextDecoration.none),
                  ],
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12)),
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                  child: TextUtils(
                      color: Colors.white,
                      fontsize: 22,
                      fontWeight: FontWeight.bold,
                      text: 'Get Start',
                      underLine: TextDecoration.none)),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(
                    color: Colors.white,
                    fontsize: 18,
                    fontWeight: FontWeight.normal,
                    text: 'Don`t hava an Account?',
                    underLine: TextDecoration.none,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.signUpScreen);
                      },
                      child: TextUtils(
                        color: Colors.white,
                        fontsize: 18,
                        fontWeight: FontWeight.normal,
                        underLine: TextDecoration.underline,
                        text: 'Sigun Up',
                      ))
                ],
              )
            ]),
          ),
        ],
      )),
    );
  }
}
