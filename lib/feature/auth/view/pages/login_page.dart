import 'package:client/core/constants/text_strings.dart';
import 'package:client/core/device/device_utility.dart';
import 'package:client/core/theme/pallete.dart';
import 'package:client/feature/auth/view/widgets/login_text_box.dart';
import 'package:client/feature/main/view/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/image_strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final double screenWidth = IDeviceUtility.getScreenWidth();
    final double screenHeight = IDeviceUtility.getScreenHeight();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 60),
          child: Column(
            children: [
              // This widget stays at the start (not centered).
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage(
                      IImageStrings.backIcon,
                    ),
                    width: 40,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 93,
                    height: 93,
                    child: Image(
                      image:
                          const AssetImage(IImageStrings.loginPageSafeMateLogo),
                      width: screenWidth / 4,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                ITextStrings.loginPageTitle,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800),
              ),
              const Text(
                ITextStrings.loginPageSubTitle,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 9,
                    color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
              SizedBox(
                height: screenHeight * 0.07,
              ),
              LoginTextBox(
                  showSuffixIcon: false,
                  hintText: ITextStrings.enterYourEmail,
                  textEditingController: emailController),
              const SizedBox(
                height: 15,
              ),
              LoginTextBox(
                  showSuffixIcon: true,
                  hintText: ITextStrings.enterYourPassword,
                  textEditingController: passwordController),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ITextStrings.forgotPassword,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromRGBO(106, 112, 124, 1),
                    decorationThickness: 2,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(106, 112, 124, 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Get.to(const MainPage()),
                  child: const Text(
                    ITextStrings.loginText,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: IDeviceUtility.getScreenWidth() *
                        0.35, // Set the width of the Divider
                    child: const Divider(
                      color: Color.fromRGBO(232, 236, 244, 1),
                    ),
                  ),
                  const Text(
                    "Or",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(106, 112, 124, 1),
                    ),
                  ),
                  SizedBox(
                    width: IDeviceUtility.getScreenWidth() *
                        0.35, // Set the width of the Divider
                    child: const Divider(
                      color: Color.fromRGBO(232, 236, 244, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromRGBO(232, 236, 244, 1),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          IImageStrings.loginPageGoogleLogo,
                          width: 21,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          ITextStrings.signupWithGoogle,
                          style: TextStyle(
                            color: Color.fromRGBO(106, 112, 124, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ITextStrings.dontHaveAnAccount,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    ITextStrings.registerNow,
                    style: TextStyle(
                      color: IPallete.primaryBlue,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
