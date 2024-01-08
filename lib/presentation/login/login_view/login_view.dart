import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/app/widget_apps.dart';

import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:fromto/presentation/resources/routes_manager.dart';
import 'package:responsive_screen_utils/responsive_screen_size_extension.dart';

import '../../../app/constant.dart';
import '../../../app/login_view_model/cubit_login.dart';
import '../../../app/login_view_model/states_login.dart';
import '../../resources/string_manager.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();


}

class _LoginScreenViewState extends State<LoginScreenView> {
  final GlobalKey<FormState> formLogInKey=GlobalKey<FormState>(debugLabel: "formLogInKey");



  @override
  Widget build(BuildContext context) {
    var passwordController=TextEditingController();
    var emailController=TextEditingController();

    return Scaffold(
      body: BlocConsumer<LoginCubit,LoginAppStates>(
        listener: (BuildContext context,  state) {  },

        builder: (BuildContext context,  state) {

          var cubitLogin=LoginCubit.get(context);

          return Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: backGroundAppLogin(
                  showLogo: true,
                  height: 700,
                  context: context,
                  widget: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppResponsive.isPhone(context)?8:200.0,vertical: 8),
                    child: Form(
                      key: formLogInKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          const SizedBox(
                            height: 70,
                          ),

                          //Email
                          customTextFormField(
                            label: StringManager.labelEmail,
                            context: context,
                            hint: StringManager.hintEmail,
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,

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

                          //Password
                          customTextFormField(
                            label: StringManager.labelPassword,
                            maxLine: 1,
                            textInputType: TextInputType.visiblePassword,
                            validator: (String? value) {
                              if(value!.isEmpty){
                                return "Password must be not empty";
                              }
                              return null;
                            },
                            context: context,
                            hint: StringManager.hintPassword,
                            controller: passwordController,
                            suffixIcon: IconButton(
                              onPressed: cubitLogin.changeEyePassword,
                              icon:Icon( cubitLogin.icon),
                            ),
                            suffixIconColor: ColorManager.grey,
                            isPassword: cubitLogin.isPassword,
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          Align(
                            alignment: Alignment.bottomRight,
                            child: customTextButton(context: context,onPressed: () {
                              Navigator.pushNamed(context,Routes.resetPasswordRoutes);
                            }, text: StringManager.textForgetPassword,)
                          ),

                          const SizedBox(
                            height: 40,
                          ),

                          //Elevated button
                          customElevatedButton(text: StringManager.textLogin, onPressed: () {
                            if (formLogInKey.currentState!.validate()) {

                            }
                          },

                          ),
                        Row
                      (mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                      StringManager.doNotHaveAccountText,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                      customTextButton(
                        context: context,
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signupRoutes);
                        }, text: StringManager.textSignUp,
                      ),
                      ]),
                        ],
                      ),
                    ),
                  ),

                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
