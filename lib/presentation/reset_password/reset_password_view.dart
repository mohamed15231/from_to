import 'package:flutter/material.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/presentation/confirm_screen/confirm_screen.dart';
import 'package:fromto/presentation/resources/string_manager.dart';
import 'package:responsive_screen_utils/responsive_screen_utils.dart';

import '../../app/constant.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: "");
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: backGroundAppLogin(

                context: context,
                widget: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppResponsive.isPhone(context)?8:200.0,vertical: 8),
                  child: Form(
                    key: ConstantApp.formResetPasswordKey,
                    child: Column(

                      children: [
                        Align(
                        alignment:AlignmentDirectional.topStart,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: iconLogoApp(),
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          StringManager.resetPasswordText,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Expanded(
                          child: Text(
                            StringManager.resetEmail,
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        //Email
                        customTextFormField(
                          label: StringManager.labelEmail,
                          context: context,
                          hint: StringManager.hintEmail,
                          controller: emailController,
                          // textInputType: TextInputType.emailAddress,

                          validator: (String? value) {
                            if(value!.isEmpty){
                              return "email must be not empty";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        //Elevated button
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: customElevatedButton(
                                text: StringManager.textReset,
                                onPressed: () {
                                  if (ConstantApp.formResetPasswordKey.currentState!
                                      .validate()) {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ConfirmScreen(text: StringManager.submitResetPasswordText,),));
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), showLogo: false,
              ),
            ),
          ),
        ));
  }
}
