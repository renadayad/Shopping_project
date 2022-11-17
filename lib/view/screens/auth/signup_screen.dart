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
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();
  // final controller = Get.put(AuthController());

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
              padding: EdgeInsets.only(left: 25, right: 25, top: 40),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextUtils(
                            text: "SIGN",
                            color: Get.isDarkMode ? mainColor : pinkClr,
                            fontWeight: FontWeight.w500,
                            fontsize: 28,
                            underLine: TextDecoration.none),
                        const SizedBox(
                          width: 3,
                        ),
                        TextUtils(
                            text: "UP",
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontsize: 28,
                            underLine: TextDecoration.none)
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AuthTextFromField(
                      controller: nameController,
                      obscureText: false,
                      validator: (value) {
                        if (value.toString().length <= 2 ||
                            !RegExp(validationName).hasMatch(value)) {
                          return "vaild name";
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: Get.isDarkMode
                          ? Icon(
                              Icons.person,
                              color: mainColor,
                              size: 30,
                            )
                          : Icon(
                              Icons.person,
                              color: pinkClr,
                              size: 30,
                            ),
                      suffixIcon: const Text(""),
                      hintText: 'Username',
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
                    const SizedBox(
                      height: 50,
                    ),
                    CheckWidget(),
                    const SizedBox(
                      height: 30,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthButton(
                        text: "SIGN UP",
                        onPressed: () {
                          if (controller.isCheckBox == false) {
                            Get.snackbar("", "please Accept terms & conditions",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: mainColor,
                                colorText: Colors.white);
                          } else if (formKey.currentState!.validate()) {
                            String name = nameController.text.trim();
                            String email = emailController.text.trim();
                            String password = passwordController.text;
                            controller.singUpUsingFirebase(
                                name: name, email: email, password: password);
                          }
                          controller.isCheckBox = true;
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          Container_Under(
            text: 'Already hava an Account?',
            typetext: "log in",
            onPressed: () {
              Get.offNamed(Routes.loginScreen);
            },
          )
        ],
      )),
    ));
  }
}
