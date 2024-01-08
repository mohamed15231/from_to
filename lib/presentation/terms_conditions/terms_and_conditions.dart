import 'package:flutter/material.dart';
import 'package:fromto/app/widget_apps.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Center(
        child: customText(
          text: "Terms And Conditions",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
      )),
    );
  }
}
