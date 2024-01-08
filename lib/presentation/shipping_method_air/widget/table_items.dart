import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fromto/app/cubit_app/cubit.dart';
import 'package:fromto/app/cubit_app/states.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:fromto/presentation/resources/string_manager.dart';

class TableItems extends StatelessWidget {
  const TableItems(
      {super.key, required this.cubit, required this.formTableItem});

  final CubitApp cubit;

  Widget headTableText(BuildContext context, {required String text}) {
    return Expanded(
      child: Center(
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 12)),
      ),
    );
  }

  final GlobalKey<FormState> formTableItem;

  Widget textFormFieldDescription(
    BuildContext context, {
    required TextEditingController controller,
    required String hint,
  }) {
    return Expanded(
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return StringManager.emptyForm;
          }
          return null;
        },
        controller: controller,
        style: Theme.of(context).textTheme.headlineMedium,
        decoration: InputDecoration(
            hintText: "Enter data",
            hintStyle: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 15),
            border: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: ColorManager.headTableDescription))),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          color: ColorManager.headTableDescription,
          child: Row(
            children: [
              headTableText(context, text: StringManager.descriptionOfGoods),
              headTableText(context, text: StringManager.grossWeight),
              headTableText(context, text: StringManager.volume),
              headTableText(context, text: StringManager.quantity),
              headTableText(context, text: StringManager.dimensions),
              headTableText(context, text: StringManager.hsCode),
              headTableText(context, text: StringManager.stackableTillable),
            ],
          ),
        ),
        for (int i = 0; i < cubit.descriptionField.length; i++) ...{
          Row(
            children: [
              textFormFieldDescription(
                context,
                controller: cubit.descriptionField[i],
                hint: StringManager.descriptionHint,
              ),
              textFormFieldDescription(
                context,
                controller: cubit.grossWeightField[i],
                hint: StringManager.grossHint,
              ),
              textFormFieldDescription(
                context,
                controller: cubit.volumeField[i],
                hint: StringManager.volumeHint,
              ),
              textFormFieldDescription(
                context,
                controller: cubit.quantityField[i],
                hint: StringManager.quantityHint,
              ),
              textFormFieldDescription(
                context,
                controller: cubit.dimensionField[i],
                hint: StringManager.dimensionsHint,
              ),
              textFormFieldDescription(
                context,
                controller: cubit.hsCodeField[i],
                hint: StringManager.hsHint,
              ),
              textFormFieldDescription(
                context,
                controller: cubit.stackableField[i],
                hint: StringManager.stackableHint,
              ),
            ],
          ),
        },
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            customTextButton(
                context: context,
                text: StringManager.addItem,
                onPressed: () {
                  cubit.addItem();
                }),
            if (cubit.descriptionField.length > 1) ...{
              const Spacer(),
              customTextButton(
                  context: context,
                  text: StringManager.removeItem,
                  onPressed: () {
                    cubit.removeItem();
                  }),
            }
          ],
        )
      ],
    );
  }


}
