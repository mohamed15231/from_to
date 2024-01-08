import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fromto/app/cubit_app/cubit.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/presentation/dashboard/widget/side_bar.dart';
import 'package:fromto/presentation/resources/assets_manager.dart';
import 'package:fromto/presentation/resources/string_manager.dart';
import '../presentation/dashboard/widget/head_bar.dart';
import '../presentation/resources/color_manager.dart';

//Custom text form field
Widget customTextFormField(
    {required BuildContext context,
    required String label,
    required String hint,
    String? Function(String?)? validator,
    TextEditingController? controller,
    Widget? suffixIcon,
    Color? suffixIconColor,
    bool isPassword = false,
    bool enabled = true,
    int? maxLine,
    TextInputType? textInputType,
    EdgeInsets? heightTextForm,
    void Function()? onTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: AppResponsive.isPhone(context) ? 18 : null,
            ),
      ),
      TextFormField(
        onTap: onTap,
        enabled: enabled,
        maxLines: maxLine,
        validator: validator,
        controller: controller,
        obscureText: isPassword,
        obscuringCharacter: "*",
        keyboardType: textInputType,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: ColorManager.grey, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding: heightTextForm,
          hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: AppResponsive.isPhone(context) ? 15 : null,
              fontWeight: FontWeight.w400),
          hintText: hint,
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor,
        ),
      ),
    ],
  );
}

//Custom elevated button
Widget customElevatedButton({
  required String text,
  required Function()? onPressed,
  Color? color,
  Color? txtColor,
}) {
  return Container(
    decoration: const BoxDecoration(boxShadow: [
      BoxShadow(
        color: Color(0x33000000),
        blurRadius: 1,
        offset: Offset(0, 3),
        spreadRadius: -2,
      ),
      BoxShadow(
        color: Color(0x23000000),
        blurRadius: 2,
        offset: Offset(0, 2),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x1E000000),
        blurRadius: 5,
        offset: Offset(0, 1),
        spreadRadius: 0,
      )
    ]),
    height: 48,
    width: 214,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: txtColor ?? ColorManager.white,
        ),
      ),
    ),
  );
}

//DASHBOARD AND BODY SHIPPING SCAFFOLD
Widget dashBoardScaffold({
  required GlobalKey<ScaffoldState> scaffoldKeyDashBoard,
  required CubitApp cubit,
  required double heightScreen,
  required BuildContext context,
  required Widget child,
  required bool showSearch,
}) {
  return Scaffold(
      key: scaffoldKeyDashBoard,
      backgroundColor: ColorManager.backGroundColorTable,
      drawer: SideBar(cubit: cubit),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: ColorManager.errorColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
              child: Row(
                children: [
                  const Icon(
                    Icons.add_alert,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: customText(
                        text:
                            "You don't have token,Confirmation will be sent soon",
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: ColorManager.black)),
                  ),
                ],
              ),
            ),
            if (heightScreen > 237)
              HeadBar(
                showSearch: showSearch,
                scaffoldKey: scaffoldKeyDashBoard,
              ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (AppResponsive.isDesktop(context))
                    Expanded(child: SideBar(cubit: cubit)),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 28.0,
                        right: 8,
                        left: 8,
                      ),
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
}

//custom text button
Widget customTextButton({
  required BuildContext context,
  required String text,
  TextAlign? textAlign,
  Color? textColor,
  TextOverflow? textOverflow,
  required void Function()? onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    autofocus: false,
    child: Text(
      text,
      overflow:textOverflow,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: textColor,
          fontSize: AppResponsive.isPhone(context) ? 15 : null,
          fontWeight: FontWeight.w400,
          decorationColor: textColor,
          decoration: TextDecoration.underline),
    ),
  );
}

//Logo App

// Widget logoApp({double? width, double? height, required BuildContext context}) {
//   return SizedBox(
//     width: width,
//     height: height,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SvgPicture.asset(
//           ImageAssets.logoImage,
//         ),
//         SvgPicture.asset(ImageAssets.fromToLogoImage),
//       ],
//     ),
//   );
// }

//Small logo app
Widget smallLogoApp({
  double? width,
  double? height,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: Column(
      children: [
        SvgPicture.asset(
          ImageAssets.smallLogoImage,
        ),
        SvgPicture.asset(ImageAssets.smallFromToLogoImage),
      ],
    ),
  );
}

//icon logo app
Widget iconLogoApp({
  double? width,
  double? height,
}) {
  return SizedBox(
    width: 100,
    height: 100,
    child: SvgPicture.asset(ImageAssets.iconLogo),
  );
}

//background App Login
Widget backGroundAppLogin({
  required Widget widget,
  double width = 1102,
  double? height,
  required BuildContext context,
  required bool showLogo,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(),
        Container(
          width: width,
          height: height ?? 627,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.00, -1.00),
              end: const Alignment(0, 1),
              colors: ColorManager.listBackGroundColor,
            ),
            shadows: const [
              BoxShadow(
                color: ColorManager.shadowColorScaffold,
                blurRadius: 40,
                offset: Offset(-2, 2),
                spreadRadius: 0,
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: showLogo
              ? Column(
                  children: [
                    Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: iconLogoApp(),
                        )),
                    widget,
                  ],
                )
              : widget,
        ),
      ],
    ),
  );
}

Widget customText({
  required String text,
  TextStyle? textStyle,
  TextAlign? textAlign,
  TextOverflow? textOverflow,
}) {
  return Text(
    text,
    style: textStyle,
    textAlign: textAlign,
    overflow:textOverflow ,
  );
}

//head Table in dashboard
Widget headTable({
  required double height,
  required String text,
  required BuildContext context,
}) {
  return Column(
    children: [
      if (height > 134)
        Container(
          padding: const EdgeInsets.all(30),
          width: 1300,
          decoration: const BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          child: customText(
              text: text,
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: ColorManager.backGroundColorTable)),
        ),
    ],
  );
}

//Error Text
Widget errorText({required BuildContext context}) {
  return customText(
      text: StringManager.emptyForm,
      textAlign: TextAlign.left,
      textStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: ColorManager.errorColor,
            fontSize: 12,
          ));
}

Widget selectStyle() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(border: Border.all(color: ColorManager.grey)),
    ),
  );
}
