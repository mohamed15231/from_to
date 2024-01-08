import 'package:flutter/material.dart';
import 'package:fromto/app/cubit_app/cubit.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:fromto/presentation/resources/string_manager.dart';

class SubmittedOffersTable extends StatefulWidget {
  const SubmittedOffersTable({super.key, required this.cubit});

  final CubitApp cubit;

  @override
  State<SubmittedOffersTable> createState() => _SubmittedOffersTableState();
}

class _SubmittedOffersTableState extends State<SubmittedOffersTable> {
  Widget _textTableSubmitted(
      {required BuildContext context, required String text}) {
    return Expanded(
      child: Center(
        child: customText(
            text: text,
            textStyle: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 15)),
      ),
    );
  }

  @override
  void initState() {
    widget.cubit.initializationListCheckBox(
        length: widget.cubit.submittedTableList.length);
    widget.cubit.loadMoreTableSubmittedShow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              color: ColorManager.backGroundHeadTableColor,
              height: 50,
              child: Row(
                children: [
                  Checkbox(
                    value: widget.cubit
                        .checkBoxBool![widget.cubit.submittedTableList.length],
                    onChanged: (value) {
                      widget.cubit.changeCheckBoxValue(
                        value: value!,
                        index: widget.cubit.submittedTableList.length,
                      );
                      widget.cubit.allListCheckBox(
                        value: value,
                        length: widget.cubit.submittedTableList.length,
                      );
                    },
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  _textTableSubmitted(
                      context: context, text: StringManager.submittedOffers),
                  _textTableSubmitted(
                      context: context, text: StringManager.serviceRating),
                  _textTableSubmitted(
                      context: context, text: StringManager.serviceName),
                  _textTableSubmitted(
                      context: context,
                      text: StringManager.serviceProviderDetails),
                ],
              ),
            ),
            for (int i = 0;
                i < widget.cubit.submittedTableList.length;
                i++) ...{
              if (i < 3 || widget.cubit.loadMoreTableSubmitted) ...{
                Container(
                  color: i.isOdd
                      ? ColorManager.backGroundTableSubmit
                      : ColorManager.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Checkbox(
                        value: widget.cubit.checkBoxBool![i],
                        onChanged: (value) {
                          widget.cubit.changeCheckBoxValue(
                            value: value!,
                            index: i,
                          );

                          widget.cubit.allIsTrue(
                              length: widget.cubit.submittedTableList.length);
                        },
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      widget.cubit.checkBoxBool![i] &&
                              widget.cubit.isPayButton[i]
                          ? _textTableSubmitted(
                              text: widget
                                  .cubit.submittedTableList[i].submittedOffers,
                              context: context)
                          : Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  customText(
                                      text: widget.cubit.submittedTableList[i]
                                          .submittedOffers[0],
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(fontSize: 15)),
                                  for (int k = 2;
                                      k <
                                              widget.cubit.submittedTableList[i]
                                                  .submittedOffers
                                                  .replaceAll(
                                                      RegExp(r"\s+"), "")
                                                  .length &&
                                          widget.cubit.submittedTableList[i]
                                                  .submittedOffers[k] !=
                                              "Q";
                                      k++) ...{
                                    Center(
                                      child: customText(
                                          text: "X",
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(fontSize: 15)),
                                    )
                                  },
                                  customText(
                                      text: "QAR",
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(fontSize: 15)),
                                ],
                              ),
                            ),
                      _textTableSubmitted(
                          text: widget.cubit.submittedTableList[i]
                              .serviceProviderRating,
                          context: context),
                      widget.cubit.checkBoxBool![i] &&
                              widget.cubit.isPayButton[i]
                          ? _textTableSubmitted(
                              text: widget.cubit.submittedTableList[i]
                                  .serviceProviderNamePaid,
                              context: context)
                          : _textTableSubmitted(
                              text: widget.cubit.submittedTableList[i]
                                  .serviceProviderName,
                              context: context),
                      _textTableSubmitted(
                          text: widget.cubit.submittedTableList[i]
                              .serviceProviderContact,
                          context: context),
                    ],
                  ),
                )
              }
            },
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                if (widget.cubit.isShowPayment) ...{
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: customElevatedButton(
                        text: "Payment",
                        onPressed: () {
                          _show(
                              ctx: context,
                              onPressedPayment: () {
                                widget.cubit
                                    .changeIsPayButton(context: context);
                              });
                        }),
                  )
                },
                const Spacer(),
                if (widget.cubit.showButtonLoadMoreTableSubmitted == true) ...{
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: customTextButton(
                        context: context,
                        textAlign: TextAlign.end,
                        text: widget.cubit.loadMoreTableSubmitted
                            ? StringManager.showLess
                            : StringManager.showMore,
                        onPressed: () {
                          if(widget.cubit.loadMoreTableSubmitted ==false) {
                            _show(
                              ctx: context,
                              onPressedPayment: () {
                                Navigator.pop(context);
                                widget.cubit
                                    .changeLoadMoreTableSubmittedStates();
                              });
                          }else{
                            widget.cubit.changeLoadMoreTableSubmittedStates();
                          }

                          // widget.cubit.changeIsPayShowMore(context: context);
                        }),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                },
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorManager.grey,
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(8),
              // height: 20,
              child: Row(
                children: [
                  Icon(
                    Icons.battery_alert,
                  ),
                  Expanded(
                    child: customText(
                        text: "Select minimum Three item to do payment Method",
                        textAlign: TextAlign.start,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: ColorManager.black)),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  void _show({
    required BuildContext ctx,
    required void Function()? onPressedPayment,
  }) {
    showDialog(
      context: ctx,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: SingleChildScrollView(
            child: Dialog(
              elevation: 6,
              insetPadding:
                  const EdgeInsets.symmetric(vertical: 240, horizontal: 30),
              child: Column(
                children: [
                  SizedBox(
                      height: 300,
                      child: customText(
                          text: "Payment Method",
                          textStyle: Theme.of(context).textTheme.bodyLarge)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              ColorManager.primaryColor),
                        ),
                        child: Text(
                          'Close',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: ColorManager.white),
                        ),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              ColorManager.primaryColor),
                        ),
                        onPressed: onPressedPayment,
                        child: Text(
                          'Pay',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: ColorManager.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
