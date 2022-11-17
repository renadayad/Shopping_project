import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controllers.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/my_string.dart';
import 'package:shop_app/utils/text_utils.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/auth/auth_button.dart';
import 'package:shop_app/view/widgets/auth/auth_text_form.dart';
import 'package:shop_app/view/widgets/auth/check_widget.dart';
import 'package:shop_app/view/widgets/auth/container_under.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
      ),
      // backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.3,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextUtils(
                            text: "LOG",
                            color: Get.isDarkMode ? mainColor : pinkClr,
                            fontWeight: FontWeight.w500,
                            fontsize: 28,
                            underLine: TextDecoration.none),
                        const SizedBox(
                          width: 3,
                        ),
                        TextUtils(
                            text: "IN",
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontsize: 28,
                            underLine: TextDecoration.none)
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthTextFromField(
                      controller: emailController,
                      obscureText: false,
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return "vaild email";
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: Get.isDarkMode
                          ? Icon(
                              Icons.email,
                              color: mainColor,
                              size: 30,
                            )
                          : Icon(
                              Icons.email,
                              color: pinkClr,
                              size: 30,
                            ),
                      suffixIcon: const Text(""),
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthTextFromField(
                        controller: passwordController,
                        obscureText: controller.isVisibilty ? false : true,
                        validator: (value) {
                          if (value.toString().length < 6) {
                            return "Password should be longer or equal to 6 characters";
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Icon(
                                Icons.lock,
                                color: mainColor,
                                size: 30,
                              )
                            : Icon(
                                Icons.lock,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.Visibilty();
                            },
                            icon: controller.isVisibilty
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  )),
                        hintText: 'Password',
                      );
                    }),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: (() {
                          Get.toNamed(Routes.forgotPasswordScreen);
                        }),
                        child: TextUtils(
                            text: "Forgot Password",
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.normal,
                            fontsize: 14,
                            underLine: TextDecoration.none),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthButton(
                        onPressed: () {
                          String email = emailController.text.trim();
                          String password = passwordController.text;
                          if (formKey.currentState!.validate()) {
                            controller.loginUsingFierbase(
                                email: email, password: password);
                          }
                        },
                        text: "LOG IN",
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextUtils(
                        text: "OR",
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontsize: 18,
                        underLine: TextDecoration.none),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GetBuilder<AuthController>(builder: (_) {
                          return InkWell(
                              onTap: () {
                                controller.googleSinUpApp();
                              },
                              child: Image.asset('assets/images/google.png'));
                        })
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container_Under(
            text: 'Don`t hava an Account?',
            typetext: "Sign up",
            onPressed: () {
              Get.offNamed(Routes.signUpScreen);
            },
          )
        ],
      )),
    ));
  }
}
