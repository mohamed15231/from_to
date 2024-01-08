import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/resources/assets_manager.dart';
import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:fromto/presentation/resources/routes_manager.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key,  this.text});
  final String? text;


  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {


  Timer? _timer;

  _delay(){
    _timer=Timer( const Duration(seconds: 6), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.dashBoard);
  }
  @override
  void initState() {
    super.initState();
    _delay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.checkAnimation),
              customText(
                text:widget.text!,
                textAlign: TextAlign.center,
                textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: ColorManager.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
