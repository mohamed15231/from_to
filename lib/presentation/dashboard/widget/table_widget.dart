import 'package:flutter/material.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:fromto/presentation/resources/routes_manager.dart';
import 'package:fromto/presentation/resources/string_manager.dart';
import 'package:fromto/presentation/shipping_method_air/shipping_view/shipping_method_air.dart';

import '../../../app/widget_apps.dart';

class TableWidget extends StatelessWidget {
  TableWidget({Key? key, required this.cubit}) : super(key: key);

  var cubit;

  @override
  Widget build(BuildContext context) {

    return Column(
        children: [

        headTable(
          height: heightScreen(context: context),
          text: StringManager.dashForImporter, context: context
        ),
        if (heightScreen(context: context) > 75)
          Container(
            color: ColorManager.backGroundHeadTableColor,
            width: 1300,
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _textTable(
                    text: "INQUIRY No.",
                    context: context,
                    color: ColorManager.headTableTextColor),
                _textTable(
                    text: "INQ DESCRIPTION",
                    context: context,
                    color: ColorManager.headTableTextColor),
                _textTable(
                    text: "OFFERS",
                    context: context,
                    color: ColorManager.headTableTextColor),
              ],
            ),
          ),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 1300,
                  decoration: const BoxDecoration(color: ColorManager.white),
                  child: Column(
                    children: [
                      const Divider(
                        color: ColorManager.grey,
                        height: 2,
                        thickness: 0.5,
                      ),

                      // IF TABLE ROW EMPTY
                      if (cubit.tablesRow.isEmpty)
                        Center(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.hourglass_empty,
                                size: 50,
                              ),
                              customText(

                                  text: "Not order Yet",
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                            ],
                          ),
                        ),

                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0;
                                i < cubit.tablesRow.length;
                                i++) ...{
                              if (i < 7 || cubit.loadMore) ...{
                                Container(
                                  color: ColorManager.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ShippingMethodPage(isComeFromDashBoard: true),));
                                        },
                                        child: _textTable(
                                            text: cubit.tablesRow[i].inquiryNo,
                                            context: context,
                                            color: ColorManager.black),
                                      ),
                                      _textTable(
                                          text: cubit.tablesRow[i]
                                              .inquiryDescription,
                                          context: context,
                                          color: ColorManager.black),
                                      Column(
                                        children: [
                                          for (int j = 0;
                                              j <
                                                  cubit.tablesRow[i]
                                                      .offers.length;
                                              j++) ...{
                                            _textTable(
                                                text: cubit.tablesRow[i]
                                                    .offers[j],
                                                context: context,
                                                color: ColorManager.black),
                                          }
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: ColorManager.grey,
                                  height: 2,
                                  thickness: 0.5,
                                ),
                              }
                            },
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (cubit.showButtonLoadMore ==
                                      true) ...{
                                    customTextButton(
                                        context: context,
                                        text: cubit.loadMore
                                            ? StringManager.showLess
                                            : StringManager.showMore,
                                        onPressed: () {
                                          cubit.changeLoadMoreStates();
                                        }),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  },
                                  customElevatedButton(
                                      text: StringManager.addNewQuery,
                                      txtColor: ColorManager.white,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Routes.shippingPage);
                                      })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _textTable({
    required BuildContext context,
    required String text,
    required Color color,
  }) {
    return customText(
        text: text,
        textStyle: TextStyle(
          color: color,
        ));
  }
}
