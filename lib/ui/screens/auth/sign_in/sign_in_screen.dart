import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furry_care/core/constants/colors.dart';
import 'package:furry_care/core/constants/text_field_decoration.dart';
import 'package:furry_care/core/constants/text_style.dart';
import 'package:furry_care/core/other/screen_utils.dart';
import 'package:furry_care/ui/custom_widgets/routes/navigation_from_right.dart';
import 'package:furry_care/ui/screens/auth/sign_in/sign_view_model.dart';
import 'package:furry_care/ui/screens/auth/sign_up/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../custom_widgets/buttons/custom_button.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInViewModel(),
      child: Consumer<SignInViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// Start Body
          ///
          body: Padding(
            padding: EdgeInsets.only(
              top: 60,
              left: 25,
              right: 25,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///
                    /// Header
                    ///
                    Text(
                      "Sign In",
                      style: style16,
                    ),
                    Text(
                      "Please Login to your account!",
                      style: style16,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),

                    ///
                    /// Email Address
                    ///
                    TextFormField(
                      maxLines: 1,
                      minLines: 1,
                      obscureText: false,
                      // hintText: 'Email Address',

                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (!val!.isEmail) {
                          return "Please enter email";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        // model.signInBody.email = val;
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
                      maxLines: 1,
                      minLines: 1,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
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
                      onChanged: (val) {
                        // model.signInBody.password = val;
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
                            color: borderColor,
                          ),
                        ),
                      ),
                    ),

                    ///
                    /// Forgot Password Button
                    ///
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            // Navigator.of(context).push(NavigationFromRightRoute(
                            //     page: EnterEmailScreen()));
                            // Get.to(() => const ForgotPassword());
                          },
                          child: Text(
                            "Forgot Password?",
                            style: style16.copyWith(color: borderColor),
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///
                          /// Custom Button
                          ///
                          CustomButton(
                              text: "Sign In",
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  // model.signIn(context);
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     NavigationFromRightRoute(
                                  //         page: RootScreen(
                                  //       selectedScreen: 0,
                                  //     )));
                                }
                              },
                              textColor: borderColor),

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
                                  // Get.to(() => SignUpScreen());
                                  Navigator.pushReplacement(
                                      context,
                                      NavigationFromRightRoute(
                                          page: SignUpScreen()));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: style16.copyWith(
                                    color: borderColor,
                                    fontWeight: FontWeight.w500,
                                  ),
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
    );
  }
}
