import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furry_care/core/constants/app_assets.dart';
import 'package:furry_care/core/constants/colors.dart';
import 'package:furry_care/core/constants/text_field_decoration.dart';
import 'package:furry_care/core/constants/text_style.dart';
import 'package:furry_care/core/other/screen_utils.dart';
import 'package:furry_care/ui/custom_widgets/buttons/custom_button.dart';
import 'package:furry_care/ui/custom_widgets/routes/navigation_from_right.dart';
import 'package:furry_care/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:furry_care/ui/screens/auth/sign_up/sign_up_view_model.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, model, child) => Scaffold(
          key: _scaffoldkey,

          ///
          /// Start Body
          ///
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 160),

                      ///
                      /// Header
                      ///
                      Text(
                        "Create Account",
                        style: style16.copyWith(fontWeight: FontWeight.bold),
                      ),

                      Text(
                        "Please register to your account!",
                        style: style16,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),

                      ///
                      /// Text Field
                      ///

                      TextFormField(
                        cursorColor: primaryColor,
                        style: const TextStyle(color: blackColor),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-z_0-9]")),
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.trim().isEmpty) {
                            return "Please enter username";
                          } else if (!RegExp("[a-z_0-9]").hasMatch(val)) {
                            return "Username must be small characters";
                          } else {
                            return null;
                          }
                        },
                        // controller: model.passwordController,
                        onChanged: (val) {
                          // model.signUpBody.username = val.trim();
                        },
                        decoration: authFieldDecoration.copyWith(
                            hintText: "Enter username"),
                      ),

                      SizedBox(height: 20),

                      ///
                      /// Email Address
                      ///

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (!val!.isEmail) {
                            return "Please enter email";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          // model.signUpBody.email = val.trim();
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: authFieldDecoration.copyWith(
                            hintText: "Enter email address"),
                      ),
                      SizedBox(height: 20),

                      ///
                      /// Password
                      ///

                      TextFormField(
                        inputFormatters: [
                          // FilteringTextInputFormatter.allow(r"\s\b|\b\s"),
                          FilteringTextInputFormatter.deny(
                              RegExp(r"\s\b|\b\s")),
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.trim().isEmpty) {
                            return "Please enter password";
                          } else if (val.trim().length < 7) {
                            return "Password length must be greater than 7 characters";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText:
                            model.passswordVisibilty == true ? true : false,

                        // controller: model.passwordController,
                        onChanged: (val) {
                          // model.signUpBody.password = val.trim();
                        },
                        decoration: authFieldDecoration.copyWith(
                          hintText: "Enter password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              model.togglePasswordVisibility();
                            },
                            child: Icon(
                              model.passswordVisibilty == false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 18,
                              // color: KTextColor2,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ///
                            /// Custom Button
                            ///
                            CustomButton(
                                text: "Continue",
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  if (_formKey.currentState!.validate()) {
                                    // model.signUp(context);
                                  }
                                },
                                textColor: primaryColor),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "New here?",
                                  style: style16.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                                TextButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    Navigator.pushReplacement(
                                        context,
                                        NavigationFromRightRoute(
                                            page: SignInScreen()));
                                    // Get.to(() => const SignInScreen());
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: style16.copyWith(
                                        color: borderColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
