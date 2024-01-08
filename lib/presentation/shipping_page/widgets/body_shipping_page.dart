import 'package:flutter/material.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:fromto/presentation/resources/routes_manager.dart';
import 'package:fromto/presentation/resources/string_manager.dart';
import 'package:fromto/presentation/shipping_method_air/shipping_view/shipping_method_air.dart';

class ShippingBody extends StatelessWidget {
  const ShippingBody({super.key});

  Widget _textShipping({
    required BuildContext context,
    required String text,
  }) {
    return customText(
        text: text,
        textStyle: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: ColorManager.black));
  }

  @override
  Widget build(BuildContext context) {



    return  Column(
      children: [
        headTable(

          height: heightScreen(context: context),
          text: StringManager.pleaseSelect,
          context: context,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: 1300,
              color: ColorManager.white,
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textShipping(
                      text: StringManager.airFright,
                      context: context),
                  const SizedBox(
                    height: 40,
                  ),
                  customElevatedButton(
                    text: StringManager.courier,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ShippingMethodPage(isComeFromDashBoard: false),));
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  _textShipping(
                      text: StringManager.seaFreight,
                      context: context),
                  const SizedBox(
                    height: 40,
                  ),
                  AppResponsive.isDesktop(context)?bodyShippingWeb(context: context):bodyShippingMobile(context: context),


                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget bodyShippingWeb({
  required BuildContext context,
}){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            customElevatedButton(
              text: StringManager.fCL,
              onPressed: () {},
            ),
            const SizedBox(
              width: 40,
            ),
            customElevatedButton(
              text: StringManager.lCL,
              onPressed: () {},
            ),
            const SizedBox(
              width: 40,
            ),
            customElevatedButton(
              text: StringManager.ROROorBULK,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        _textShipping(
            text: StringManager.landFreight,
            context: context),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            customElevatedButton(
              text: StringManager.fTL,
              onPressed: () {},
            ),
            const SizedBox(
              width: 40,
            ),
            customElevatedButton(
              text: StringManager.lTL,
              onPressed: () {},
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        const Divider(
          height: 1,
          color: ColorManager.grey,
          thickness: 0.1,
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
            alignment:
            AlignmentDirectional.bottomEnd,
            child: customTextButton(
                context: context,
                text: StringManager.cancel,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.dashBoard);
                }))
      ],
    );
  }

  Widget bodyShippingMobile({
  required BuildContext context,
}){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        customElevatedButton(
          text: StringManager.fCL,
          onPressed: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        customElevatedButton(
          text: StringManager.lCL,
          onPressed: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        customElevatedButton(
          text: StringManager.ROROorBULK,
          onPressed: () {},
        ),
        const SizedBox(
          height: 50,
        ),
        _textShipping(
            text: StringManager.landFreight,
            context: context),
        const SizedBox(
          height: 40,
        ),
        customElevatedButton(
          text: StringManager.fTL,
          onPressed: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        customElevatedButton(
          text: StringManager.lTL,
          onPressed: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 50,
        ),
        const Divider(
          height: 1,
          color: ColorManager.grey,
          thickness: 0.1,
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
            alignment:
            AlignmentDirectional.bottomEnd,
            child: customTextButton(
                context: context,
                text: StringManager.cancel,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.dashBoard);
                }))
      ],
    );
  }
}
