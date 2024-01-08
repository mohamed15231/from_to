
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fromto/app/cubit_app/cubit.dart';
import 'package:fromto/app/login_view_model/cubit_login.dart';
import 'package:fromto/app/login_view_model/states_login.dart';
import 'package:fromto/presentation/login/login_view/login_view.dart';
import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:fromto/presentation/resources/routes_manager.dart';
import 'package:fromto/presentation/resources/theme_manager.dart';
import 'package:responsive_screen_utils/responsive_screenutil_init.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();
  static final MyApp instance=MyApp._internal();
  factory MyApp()=>instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenUtilInit(
      designSize: const Size(360, 690),
      allowFontScaling: false,

      child: MultiBlocProvider(
        providers: [

          //todo choose if login or app cubit
          BlocProvider( create: (BuildContext context) =>LoginCubit(),),
          BlocProvider( create: (BuildContext context) =>CubitApp(),)
        ],

        child: BlocConsumer<LoginCubit,LoginAppStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return MaterialApp(

              initialRoute: Routes.signupRoutes,
              onGenerateRoute:RouteGenerator.getRoutes ,
              debugShowCheckedModeBanner: false,
              theme:themeManager(),
            );
          },
        ),
      ),
    );
  }
}


