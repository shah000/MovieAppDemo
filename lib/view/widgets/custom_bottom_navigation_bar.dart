import 'package:flutter/material.dart';
import 'package:movieapp/utils/app_labels.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_size.dart';
import 'bottom_navigation_items.dart';

class CustomBottomNavigatonBar extends StatelessWidget {
  const CustomBottomNavigatonBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bottombarbg,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      width: AppSize.width(context),
      height: AppSize.height(context) * 0.09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 0),
            child: BottomNavigationItem(
              img: AppImages.dashboard,
              title: AppLabels.dashboard,
              color: AppColors.textgreyColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 0),
            child: BottomNavigationItem(
              img: AppImages.watch,
              title: AppLabels.watch,
              color: AppColors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 0),
            child: BottomNavigationItem(
              img: AppImages.mediaLibrary,
              title: AppLabels.mediaLibrary,
              color: AppColors.textgreyColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 0),
            child: BottomNavigationItem(
              img: AppImages.more,
              title: AppLabels.more,
              color: AppColors.textgreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
