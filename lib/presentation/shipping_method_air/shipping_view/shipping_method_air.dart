import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fromto/app/cubit_app/cubit.dart';
import 'package:fromto/app/cubit_app/states.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/resources/assets_manager.dart';
import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:fromto/presentation/resources/drop_list_widget.dart';
import 'package:fromto/presentation/resources/string_manager.dart';
import 'package:fromto/presentation/shipping_method_air/widget/pick_date.dart';
import 'package:fromto/presentation/shipping_method_air/widget/row_drop_list.dart';
import 'package:fromto/presentation/shipping_method_air/widget/row_text_form_field.dart';


import '../widget/table_items.dart';
import '../widget/table_submitted_offers.dart';
import '../widget/upload_an_attachment.dart';

class ShippingMethodPage extends StatelessWidget {
  const ShippingMethodPage({super.key, required this.isComeFromDashBoard});

  final bool isComeFromDashBoard;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final GlobalKey<FormState> formShippingMethod =
        GlobalKey<FormState>(debugLabel: "Shipping Method");




    // Option 2

    return BlocConsumer<CubitApp, CubitAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CubitApp.get(context);

        return dashBoardScaffold(
          showSearch: false,
          context: context,
          cubit: cubit,
          scaffoldKeyDashBoard: scaffoldKey,
          child: Form(
            key: formShippingMethod,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                headTable(
                  height: heightScreen(context: context),
                  text: StringManager.shippingMethod,
                  context: context,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: 1300,
                      color: ColorManager.white,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Row Drop Lists
                            RowDropList(cubit: cubit),

                            //Row Text Form Fields
                            RowTextFormField(),
                            const SizedBox(
                              height: 24,
                            ),

                            //Upload Image
                            const UploadAnAttachment(
                              label: StringManager.attachPackingList,
                            ),

                            //Upload Image
                            const UploadAnAttachment(
                              label: StringManager.attachMSDSifDG,
                            ),
                            const SizedBox(
                              height: 20,
                            ),


                            //Dates
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PickUpDate(
                                  selectDate: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                            builder: (context, child) {
                                              return Theme(
                                                data: Theme.of(context).copyWith(
                                                  colorScheme: const ColorScheme.light(
                                                    primary: ColorManager.primaryColor, // header background color
                                                    onPrimary: ColorManager.grey, // header text color
                                                    onSurface: ColorManager.primaryColor, // body text color
                                                    background: ColorManager.white,
                                                    brightness: Brightness.light,
                                                    onBackground:  ColorManager.white

                                                  ),
                                                  textButtonTheme: TextButtonThemeData(
                                                    style: TextButton.styleFrom(
                                                      foregroundColor: ColorManager.primaryColor, // button text color
                                                    ),
                                                  ),
                                                ),
                                                child: child!,
                                              );
                                            },
                                            context: context,
                                            initialDate: cubit.firstDate,
                                            firstDate: cubit.firstDate,
                                            lastDate: DateTime(2101));
                                    if (picked != null &&
                                        picked != cubit.firstDate) {
                                      cubit.changeShipperDate(
                                          picked: picked);
                                    }
                                  },
                                  colorBorder: cubit.shipmentDate ==
                                          ShipmentDate.none
                                      ? ColorManager.errorColor
                                      : ColorManager.grey,
                                  showText: cubit.dateShipper,
                                ),
                                if (cubit.shipmentDate == ShipmentDate.none)
                                  errorText(context: context),
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            //Table Description
                            TableItems(
                              cubit: cubit,
                              formTableItem: formShippingMethod,
                            ),

                            const SizedBox(
                              height: 20,
                            ),


                            //Special Remarks Text Form Field
                            customTextFormField(
                              context: context,
                              label: StringManager.specialRemarks,
                              hint: StringManager.type,
                              textInputType: TextInputType.multiline,
                              heightTextForm: const EdgeInsets.all(50),
                            ),

                            const SizedBox(
                              height: 20,
                            ),


                            //Total target rate /Excluding Text Form Field
                            customTextFormField(
                                context: context,
                                label: StringManager.totalTarget,
                                hint: "000",
                                suffixIcon: customText(
                                    text: "QAR",
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(color: ColorManager.black)),
                                textInputType: TextInputType.text),


                            const SizedBox(
                              height: 20,
                            ),

                             //Table Of Submitted Offer
                             SubmittedOffersTable(
                              cubit: cubit,
                            ),

                            const SizedBox(
                              height: 20,
                            ),


                            //Icon Inquiry
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [




                                if(isComeFromDashBoard)...{
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: customTextButton(
                                        context: context,
                                        textColor: ColorManager.deleteIcon,

                                        text: StringManager.delete,
                                        onPressed: () {
                                        }),
                                  ),

                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: customElevatedButton(
                                        text: StringManager.edit,
                                        onPressed: () {
                                      cubit.changeIsEditState();
                                        }),
                                  ),

                                  // ignore: equal_elements_in_set
                                  const SizedBox(
                                    width: 20,
                                  ),

                                },
                                if(!isComeFromDashBoard||cubit.isEdit)
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: customElevatedButton(
                                        text: StringManager.addInquiry,
                                        onPressed: () {
                                          cubit.validationDropList();

                                          if (formShippingMethod.currentState!
                                              .validate() &&
                                              cubit.isSelectFrom == SelectFrom.select &&
                                              cubit.isSelectTo == SelectTo.select &&
                                              cubit.isSelectService ==
                                                  SelectService.select &&
                                              cubit.isSelectIncoterm ==
                                                  SelectIncoterm.select) {}
                                        }),
                                  ),





                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          heightScreen: heightScreen(context: context),
        );
      },
    );
  }
}
