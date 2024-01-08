import 'package:flutter/material.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/app/shared.dart';

import '../../resources/color_manager.dart';
import '../../resources/string_manager.dart';

class HeadBar extends StatelessWidget {
  const HeadBar({super.key, required this.scaffoldKey, required this.showSearch});
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showSearch;


  @override
  Widget build(BuildContext context) {

    return  Container(
      height: 80,
      decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
      child: Padding(
        padding: AppResponsive.isDesktop(context)? const EdgeInsets.symmetric(horizontal: 60.0):const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisAlignment:!AppResponsive.isPhone(context)? MainAxisAlignment.spaceBetween:MainAxisAlignment.start,
          children: [
            if(!AppResponsive.isDesktop(context))
              IconButton(onPressed: ()=> scaffoldKey.currentState!.openDrawer(),
                  icon: const Icon(Icons.menu)),
            iconLogoApp(),
            if(showSearch)...{
              widthScreen(context: context)>964?
              Container(
                margin:  const EdgeInsets.all(8),
                width: 537,
                clipBehavior: Clip.antiAlias,
                decoration: const ShapeDecoration(shape: RoundedRectangleBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 30,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],

                ),
                child: TextFormField(

                  decoration:   InputDecoration(

                    prefixIcon: Icon(Icons.search),
                    hintText: StringManager.textSearch,
                    fillColor: ColorManager.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)
                    ),


                  ),
                ),
              ):Expanded(
                child: Container(
                  margin:  EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias,
                  decoration: const ShapeDecoration(shape: RoundedRectangleBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 30,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],

                  ),
                  child: TextFormField(

                    decoration:   InputDecoration(

                      prefixIcon: Icon(Icons.search),
                      hintText: StringManager.textSearch,
                      fillColor: ColorManager.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)
                      ),


                    ),
                  ),
                ),
              ),
            },

            if(widthScreen(context: context)>500)
              customText(
                text: StringManager.welcomeMr,
                textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: AppResponsive.isPhone(context)? 15:25,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.black
                )
            )
          ],
        ),
      ),
    );
  }
}
