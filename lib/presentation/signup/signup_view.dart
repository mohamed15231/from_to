import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/app/login_view_model/cubit_login.dart';
import 'package:fromto/app/login_view_model/states_login.dart';
import 'package:fromto/presentation/confirm_screen/confirm_screen.dart';
import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:open_file/open_file.dart';
import 'package:responsive_screen_utils/responsive_screen_utils.dart';
import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import '../resources/string_manager.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var companyController = TextEditingController();
    var crNumberController = TextEditingController();
    var companyCardController = TextEditingController();
    var phoneController = TextEditingController();
    var countryController = TextEditingController();
    var cityController = TextEditingController();
    var addressController = TextEditingController();
    // ignore: non_constant_identifier_names
    var POBoxController = TextEditingController();
    final GlobalKey<FormState> formSignUpKey =
        GlobalKey<FormState>(debugLabel: "SignUpKey");

    return Scaffold(
        body: BlocConsumer<LoginCubit, LoginAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        print(widthScreen(context: context));
        var cubit = LoginCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: SafeArea(
              child: backGroundAppLogin(
                showLogo: true,
                height: AppResponsive.isPhone(context) ? 1900 : 1600,
                context: context,
                widget: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppResponsive.isPhone(context) ? 8 : 50.0,
                      vertical: 8),
                  child: Form(
                    key: formSignUpKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          StringManager.registerFromTo,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: ColorManager.black.withOpacity(0.70),
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Text(
                          StringManager.registerAs,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: ColorManager.black.withOpacity(0.70),
                                  ),
                        ),

                        Row(
                          children: [
                            //importer button

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: customElevatedButton(
                                    color: cubit.loginAs == LoginAs.importer
                                        ? ColorManager.white
                                        : ColorManager.primaryColor,
                                    txtColor: cubit.loginAs != LoginAs.importer
                                        ? ColorManager.white
                                        : ColorManager.primaryColor,
                                    text: StringManager.importer,
                                    onPressed: () {
                                      cubit.loginAsImporter();
                                    }),
                              ),
                            ),

                            //Server Provider button

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: customElevatedButton(
                                  text: StringManager.serverProvider,
                                  color: cubit.loginAs == LoginAs.serverProvider
                                      ? ColorManager.white
                                      : ColorManager.primaryColor,
                                  txtColor:
                                      cubit.loginAs != LoginAs.serverProvider
                                          ? ColorManager.white
                                          : ColorManager.primaryColor,
                                  onPressed: () {
                                    cubit.loginAsServerProvider();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (cubit.showMessage == ShowMessage.show)
                          Text(
                            "Please Choice one",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: ColorManager.errorColor),
                          ),

                        //company name
                        formSignUp(
                            context: context,
                            hint: StringManager.companyNameHint,
                            controller: companyController,
                            label: StringManager.companyName,
                            textInputType: TextInputType.text),

                        //company name
                        formSignUp(
                          context: context,
                          hint: StringManager.companyCrNumberHint,
                          controller: crNumberController,
                          label: StringManager.companyCrNumber,
                          textInputType: TextInputType.text,
                          suffixIcon: InkWell(
                            onTap: () async {},
                            child: SvgPicture.asset(
                                AppResponsive.isPhone(context)
                                    ? ImageAssets.uploadFileMobileImage
                                    : ImageAssets.uploadFileImage),
                          ),
                        ),

                        //company name
                        formSignUp(
                          context: context,
                          hint: StringManager.companyComputerCardNumberHint,
                          controller: companyCardController,
                          label: StringManager.companyComputerCardNumber,
                          textInputType: TextInputType.text,
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                                AppResponsive.isPhone(context)
                                    ? ImageAssets.uploadFileMobileImage
                                    : ImageAssets.uploadFileImage),
                          ),
                        ),

                        if (AppResponsive.isPhone(context)) ...{
                          //Phone N Email

                          //Email
                          formSignUp(
                              context: context,
                              hint: StringManager.hintEmail,
                              controller: emailController,
                              label: StringManager.labelEmail,
                              textInputType: TextInputType.emailAddress),

                          //Phone
                          formSignUp(
                              context: context,
                              hint: StringManager.phoneNumberCardHint,
                              controller: phoneController,
                              label: StringManager.phoneNumberCard,
                              textInputType: TextInputType.number),

                          //Country N City

                          //Country
                          formSignUp(
                              context: context,
                              hint: StringManager.countryHint,
                              controller: countryController,
                              label: StringManager.countryText,
                              textInputType: TextInputType.text),

                          //Phone
                          formSignUp(
                              context: context,
                              hint: StringManager.cityHint,
                              controller: cityController,
                              label: StringManager.cityText,
                              textInputType: TextInputType.text),

                          //address N P.O box num

                          //Address
                          formSignUp(
                            context: context,
                            hint: StringManager.addressHint,
                            controller: addressController,
                            label: StringManager.addressText,
                            textInputType: TextInputType.streetAddress,
                          ),

                          //P.O box num
                          formSignUp(
                              context: context,
                              hint: StringManager.POBoxHint,
                              controller: POBoxController,
                              label: StringManager.POBoxText,
                              textInputType: TextInputType.number),
                        } else ...{
                          //Phone N Email
                          Row(
                            children: [
                              //Email
                              Expanded(
                                child: formSignUp(
                                    context: context,
                                    hint: StringManager.hintEmail,
                                    controller: emailController,
                                    label: StringManager.labelEmail,
                                    textInputType: TextInputType.emailAddress),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              //Phone
                              Expanded(
                                child: formSignUp(
                                    context: context,
                                    hint: StringManager.phoneNumberCardHint,
                                    controller: phoneController,
                                    label: StringManager.phoneNumberCard,
                                    textInputType: TextInputType.number),
                              ),
                            ],
                          ),

                          //Country N City
                          Row(
                            children: [
                              //Country
                              Expanded(
                                child: formSignUp(
                                    context: context,
                                    hint: StringManager.countryHint,
                                    controller: countryController,
                                    label: StringManager.countryText,
                                    textInputType: TextInputType.text),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              //Phone
                              Expanded(
                                child: formSignUp(
                                    context: context,
                                    hint: StringManager.cityHint,
                                    controller: cityController,
                                    label: StringManager.cityText,
                                    textInputType: TextInputType.text),
                              ),
                            ],
                          ),

                          //address N P.O box num
                          Row(
                            children: [
                              //Address
                              Expanded(
                                child: formSignUp(
                                  context: context,
                                  hint: StringManager.addressHint,
                                  controller: addressController,
                                  label: StringManager.addressText,
                                  textInputType: TextInputType.streetAddress,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              //P.O box num
                              Expanded(
                                child: formSignUp(
                                    context: context,
                                    hint: StringManager.POBoxHint,
                                    controller: POBoxController,
                                    label: StringManager.POBoxText,
                                    textInputType: TextInputType.number),
                              ),
                            ],
                          ),
                        },

                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: cubit.agree,
                                onChanged: (value) {
                                  cubit.changeAgreeState(value: value!);
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                width: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    customText(
                                        text: " I have read and accept ",
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                              fontSize: widthScreen(
                                                          context: context) <
                                                      498
                                                  ? 8
                                                  : null,
                                            )),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            Routes.termsAndConditional);
                                      },
                                      child: Expanded(
                                        child: customText(
                                          text: " terms and conditions ",
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: Colors.blue,
                                            fontSize: widthScreen(context: context)<498?8:null,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        //Elevated button signup

                        customElevatedButton(
                            text: StringManager.textSignUp,
                            onPressed: cubit.agree
                                ? () {
                                    if (formSignUpKey.currentState!
                                            .validate() &&
                                        cubit.loginAs != LoginAs.none) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ConfirmScreen(
                                              text: StringManager.submitText,
                                            ),
                                          ));
                                    } else {
                                      if (cubit.loginAs == LoginAs.none) {
                                        cubit.showMessageMethod();
                                      }
                                    }
                                  }
                                : null),

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 22.0),
                          child: Divider(
                            color: ColorManager.grey,
                            thickness: 1,
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                StringManager.alreadyHaveAccountText,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    Theme.of(context).textTheme.headlineMedium!.copyWith(
                                      fontSize:  widthScreen(
                                          context: context) <
                                          498
                                          ? 10
                                          : null,
                                    ),
                              ),
                              customTextButton(
                                text: "login",
                                textOverflow: TextOverflow.fade,
                                context: context,

                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.loginRoute);
                                },
                              ),
                            ])
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }

  Widget formSignUp({
    required BuildContext context,
    TextEditingController? controller,
    required String label,
    required String hint,
    required TextInputType textInputType,
    Widget? suffixIcon,
  }) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        customTextFormField(
          label: label,
          suffixIcon: suffixIcon,
          context: context,
          hint: hint,
          controller: controller,
          textInputType: textInputType,
          validator: (String? value) {
            if (value!.isEmpty) {
              return StringManager.emptyForm;
            }
            return null;
          },
        ),
      ],
    );
  }
}
