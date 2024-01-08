import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fromto/app/cubit_app/cubit.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:fromto/presentation/resources/drop_list_widget.dart';

import '../../resources/string_manager.dart';

class RowDropList extends StatelessWidget {
  const RowDropList({super.key, required this.cubit});
  final CubitApp cubit;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //select From

            DropListWidget(
              isError:  cubit.isSelectFrom == SelectFrom.none,

              hint: StringManager.selectCountry,
              text: StringManager.from,
              onChange: (value) {
                cubit.onchangeFromList(value!);
              },
              value: cubit.selectFrom,
              item: cubit.fromList.map((location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(location),
                );
              }).toList(), cubit: cubit,
            ),


            const SizedBox(
              width: 32,
            ),
            //Select To

            DropListWidget(
              isError:  cubit.isSelectTo == SelectTo.none,

              hint: StringManager.selectCountry,
              text: StringManager.to,
              onChange: (value) {
                cubit.onchangeToList(value!);
              },
              value: cubit.selectedTo,
              item: cubit.toList.map((location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(location),
                );
              }).toList(), cubit: cubit,
            ),


          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            //select Service
            DropListWidget(
              isError:  cubit.isSelectService == SelectService.none,
              hint: StringManager.selectService,
              text: StringManager.service,
              onChange: (value) {
                cubit.onchangeServiceList(value!);
              },
              value: cubit.selectService,
              item:
              cubit.selectServiceList.map((location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(location),
                );
              }).toList(), cubit: cubit,
            ),



            const SizedBox(
              width: 32,
            ),

            //select Incoterm

            DropListWidget(onChange:(value) {
              cubit.onchangeSelectIncotermList(value!);
            },  value: cubit.selectIncoterm, item: cubit.selectIncotermList.map((value){
              return DropdownMenuItem(child:Text(value),
              value:value,

              );
            }).toList(), hint: StringManager.selectOne, text: StringManager.inCoterm, cubit: cubit, isError: cubit.isSelectIncoterm == SelectIncoterm.none)

            // DropListWidget(
            //   cubit: cubit,
            //   isError: cubit.isSelectIncoterm == SelectIncoterm.none,
            //   hint: StringManager.selectOne,
            //   text: StringManager.inCoterm,
            //   onChange: (value) {
            //     cubit.onchangeSelectIncotermList(value!);
            //   },
            //   value: cubit.selectIncoterm,
            //   item: cubit.selectIncotermList
            //       .map((location) {
            //     return DropdownMenuItem(
            //       value: location,
            //       child: Text(location),
            //     );
            //   }).toList(),
            // ),

          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
