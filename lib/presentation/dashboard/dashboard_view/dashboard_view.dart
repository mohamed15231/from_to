import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fromto/app/cubit_app/cubit.dart';
import 'package:fromto/app/cubit_app/states.dart';
import 'package:fromto/app/login_view_model/cubit_login.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/dashboard/widget/table_widget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKeyDashBoard =
      GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // LoginCubit().close();
    LoginCubit().close();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CubitApp()..loadMoreShow();
      },
      child: BlocConsumer<CubitApp, CubitAppStates>(
        listener: (context, state) {
          if (state is InitCubitAppStates) {
            CubitApp.get(context).loadMoreShow();
          }
        },
        builder: (context, state) {
          var cubit = CubitApp.get(context);
          return dashBoardScaffold(
            showSearch: true,
            context: context,
            cubit: cubit,
            scaffoldKeyDashBoard: _scaffoldKeyDashBoard,
            heightScreen: heightScreen(context: context),
            child: TableWidget(
              cubit: cubit,
            ),
          );

        },
      ),
    );
  }
}
