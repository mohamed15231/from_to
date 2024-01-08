import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fromto/presentation/resources/assets_manager.dart';

class UploadAnAttachment extends StatelessWidget {
  const UploadAnAttachment({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),

        InkWell(
            onTap: () {},
            child: SvgPicture.asset(
                ImageAssets.uploadAnAttachment)),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
