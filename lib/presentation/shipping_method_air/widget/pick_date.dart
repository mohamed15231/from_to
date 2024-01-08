import 'package:flutter/material.dart';
import 'package:fromto/app/cubit_app/cubit.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:fromto/presentation/resources/string_manager.dart';
import 'package:intl/intl.dart';

class PickUpDate extends StatelessWidget {
  const PickUpDate({super.key, required this.selectDate, this.showText, required this.colorBorder});

  final Function() selectDate;
  final String? showText;
  final Color colorBorder;


  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    Text(
      StringManager.shipmentReadinessDate,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    InkWell(
      onTap: selectDate,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        width: double.infinity,
        decoration:  BoxDecoration(
          border: Border(
            bottom: BorderSide(color:colorBorder,),
          ),
        ),
        child: Row(
          children: [
            Expanded(
                child: showText == null
                    ? Text(
                        "Select Date",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    : Text(
                        showText.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.blue),
                      )),
            const Icon(
              Icons.calendar_month,
              color: ColorManager.grey,
            )
          ],
        ),
      ),
    )
          ],
        );
  }
}
