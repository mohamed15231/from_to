import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fromto/app/cubit_app/cubit.dart';
import 'package:fromto/app/cubit_app/states.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/resources/routes_manager.dart';
import 'package:fromto/presentation/shipping_page/widgets/body_shipping_page.dart';


class ShippingPage extends StatelessWidget {
  ShippingPage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CubitApp, CubitAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CubitApp.get(context);
        return dashBoardScaffold(
          showSearch: false,
          heightScreen:heightScreen(context: context),
          scaffoldKeyDashBoard: _scaffoldKey,
          cubit: cubit,
          context: context,
          child: const ShippingBody()
        );
      },
    );
  }


}
