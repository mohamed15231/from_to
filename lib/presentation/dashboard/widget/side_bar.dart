import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/app/cubit_app/cubit.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/presentation/resources/assets_manager.dart';
import 'package:fromto/presentation/resources/string_manager.dart';

import '../../resources/color_manager.dart';

class SideBar extends StatelessWidget {
  SideBar({Key? key, required this.cubit}) : super(key: key);

  CubitApp cubit;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        child: Container(
          width: 300,
          height: AppResponsive.isPhone(context) ? height - 60 : 750,
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(25)),
          margin: const EdgeInsets.only(top: 10, right: 30, bottom: 10),

          // padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textTabBar(
                  textColor:
                      cubit.selectItemSideBar == SelectItemSideBar.dashboard
                          ? ColorManager.white
                          : ColorManager.grey,
                  text: StringManager.dashboard,
                  context: context,
                  backGroundColor:
                      cubit.selectItemSideBar == SelectItemSideBar.dashboard
                          ? ColorManager.primaryColor
                          : ColorManager.white,
                  onTap: () {
                    cubit.selectDashboard();
                  }),
              textTabBar(
                  textColor:
                      cubit.selectItemSideBar == SelectItemSideBar.masterList
                          ? ColorManager.white
                          : ColorManager.grey,
                  text: StringManager.masterList,
                  context: context,
                  backGroundColor:
                      cubit.selectItemSideBar == SelectItemSideBar.masterList
                          ? ColorManager.primaryColor
                          : ColorManager.white,
                  onTap: () {
                    cubit.selectMasterList();
                  }),
              textTabBar(
                  textColor:
                      cubit.selectItemSideBar == SelectItemSideBar.history
                          ? ColorManager.white
                          : ColorManager.grey,
                  text: StringManager.history,
                  context: context,
                  backGroundColor:
                      cubit.selectItemSideBar == SelectItemSideBar.history
                          ? ColorManager.primaryColor
                          : ColorManager.white,
                  onTap: () {
                    cubit.selectHistory();
                  }),
              textTabBar(
                  textColor:
                      cubit.selectItemSideBar == SelectItemSideBar.profile
                          ? ColorManager.white
                          : ColorManager.grey,
                  text: StringManager.profile,
                  context: context,
                  backGroundColor:
                      cubit.selectItemSideBar == SelectItemSideBar.profile
                          ? ColorManager.primaryColor
                          : ColorManager.white,
                  onTap: () {
                    cubit.selectProfile();
                  }),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  bottom: 16.0,
                  right: 16.0,
                ),
                child: Row(
                  children: [
                    customText(
                        text: StringManager.logOut,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: const Color(0xffE65B69))),
                    const Spacer(),
                    SvgPicture.asset(ImageAssets.logOutLogo),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textTabBar(
      {required String text,
      required BuildContext context,
      required Color backGroundColor,
      required Color textColor,
      required Function() onTap}) {
    return Container(
      width: double.infinity,
      color: backGroundColor,
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            customText(
                text: text,
                textAlign: TextAlign.center,
                textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: textColor,
                      fontSize: 22,
                    )),
          ],
        ),
      ),
    );
  }
}
