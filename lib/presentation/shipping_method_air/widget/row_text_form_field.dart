import 'package:flutter/material.dart';
import 'package:fromto/app/widget_apps.dart';
import 'package:fromto/presentation/resources/string_manager.dart';

class RowTextFormField extends StatelessWidget {
   RowTextFormField({super.key});
  var airPortController = TextEditingController();
  var airAirportOfArrival = TextEditingController();
  var shipperController = TextEditingController();
  var receiverController = TextEditingController();
  var pickupAddress = TextEditingController();
  var shipperDetails = TextEditingController();
  var receiverDetails = TextEditingController();
  var deliveryAddress = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [

        Row(
          children: [
            //AirPort Of Departure text form field
            Expanded(
              child: customTextFormField(
                label: StringManager.airPortOfDeparture,
                context: context,
                hint: StringManager.enterAirport,
                controller: airPortController,
                textInputType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return StringManager.emptyForm;
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(
              width: 32,
            ),


            //AirPort Of Arrival text form field
            Expanded(
              child: customTextFormField(
                label: StringManager.airportOfArrival,
                context: context,
                hint: StringManager.enterAirport,
                controller: airAirportOfArrival,
                textInputType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return StringManager.emptyForm;
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            //shipper name Of Departure text form field
            Expanded(
              child: customTextFormField(
                label: StringManager.shipperName,
                context: context,
                hint: StringManager.shipperHint,
                controller: shipperController,
                textInputType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return StringManager.emptyForm;
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(
              width: 32,
            ),
            //receiver name
            Expanded(
              child: customTextFormField(
                label: StringManager.receiverName,
                context: context,
                hint: StringManager.receiverHint,
                controller: receiverController,
                textInputType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return StringManager.emptyForm;
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            //pickup Address Of Departure text form field
            Expanded(
              child: customTextFormField(
                label: StringManager.pickupAddress,
                context: context,
                hint: StringManager.pickupAddressHint,
                controller: pickupAddress,
                textInputType: TextInputType.text,

                validator: (String? value) {
                  if (value!.isEmpty) {
                    return StringManager.emptyForm;
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(
              width: 32,
            ),
            //delivery Address
            Expanded(
              child: customTextFormField(
                label: StringManager.deliveryAddress,
                context: context,
                hint: StringManager.deliveryAddressHint,
                controller: deliveryAddress,
                textInputType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return StringManager.emptyForm;
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            //pickup Address Of Departure text form field
            Expanded(
              child: customTextFormField(
                label: StringManager.shipperDetails,
                context: context,
                hint: StringManager.enterDetails,
                controller: shipperDetails,
                textInputType: TextInputType.multiline,
                heightTextForm: const EdgeInsets.all(50),

                validator: (String? value) {
                  if (value!.isEmpty) {
                    return StringManager.emptyForm;
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(
              width: 32,
            ),
            //delivery Address
            Expanded(
              child: customTextFormField(
                label: StringManager.receiverDetails,
                context: context,
                hint: StringManager.enterDetails,
                controller: receiverDetails,
                textInputType: TextInputType.multiline,
                heightTextForm: const EdgeInsets.all(50),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return StringManager.emptyForm;
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
