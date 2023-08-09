import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_size.dart';

class CustomBlueButton extends StatelessWidget {
  const CustomBlueButton({
    super.key,
    required this.onTap,
    required this.title,
  });
  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            fixedSize:
                Size(AppSize.width(context), AppSize.height(context) * 0.07),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: AppColors.blueButton),
        onPressed: () {
          onTap();
        },
        child: Text(
          title,
          style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800),
        ));
  }
}
