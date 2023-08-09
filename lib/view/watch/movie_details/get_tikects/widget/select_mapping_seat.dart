import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../../utils/app_size.dart';

class SelectMappingSeat extends StatelessWidget {
  const SelectMappingSeat({
    super.key,
    required this.time,
    required this.price,
    required this.bonus,
  });
  final String time;
  final String price;
  final String bonus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(time),
            SizedBox(
              width: AppSize.width(context) * 0.02,
            ),
            Text(
              "Cinetech + hall 1",
              style: TextStyle(color: AppColors.textgreyColor),
            ),
          ],
        ),
        SizedBox(
          height: AppSize.height(context) * 0.02,
        ),
        Container(
          width: AppSize.width(context) * 0.55,
          height: AppSize.height(context) * 0.22,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.blue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SvgPicture.asset(AppImages.smallSeatMap),
          ),
        ),
        SizedBox(
          height: AppSize.height(context) * 0.02,
        ),
        RichText(
          text: TextSpan(
              text: 'From ',
              style: TextStyle(color: AppColors.textgreyColor, fontSize: 16),
              children: <TextSpan>[
                TextSpan(
                  text: '$price\$ ',
                  style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                TextSpan(
                  text: 'or ',
                  style:
                      TextStyle(color: AppColors.textgreyColor, fontSize: 16),
                ),
                TextSpan(
                  text: '$bonus Bonus',
                  style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ]),
        ),
      ],
    );
  }
}
