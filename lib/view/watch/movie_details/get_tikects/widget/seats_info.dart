import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_size.dart';

class SeatInfo extends StatelessWidget {
  const SeatInfo({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          SvgPicture.asset(image),
          SizedBox(
            width: AppSize.width(context) * 0.02,
          ),
          Text(
            title,
            style: TextStyle(color: AppColors.textgreyColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}
