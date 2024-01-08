import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fromto/app/cubit_app/cubit.dart';
import 'package:fromto/app/cubit_app/states.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/resources/color_manager.dart';

import '../../app/shared.dart';

class DropListWidget extends StatelessWidget {
  DropListWidget({
    required this.onChange,
    required this.value,
    required this.item,
    required this.hint,
    required this.text,
    required this.cubit,
    required this.isError,
    super.key,
  });

  CubitApp cubit;
  String? value;
  void Function(String?) onChange;
  List<DropdownMenuItem<String>> item;
  final String hint;
  final String text;
  bool isError;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          DropdownButtonFormField(



            decoration:  InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: isError?ColorManager.errorColor:ColorManager.grey )
              ) ,
                  suffixIcon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 24,
              )),
              icon: Container(),
              hint: Text(
                hint,
              style: Theme.of(context).textTheme.headlineMedium,
              ),

              // Not necessary for Option 1
              value: value,
              onChanged: onChange,
              items: item),
          if(isError)
            errorText(context: context),
        ],
      ),
    );
  }
}
