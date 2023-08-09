import 'package:flutter/material.dart';
import 'package:movieapp/utils/app_labels.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_size.dart';

class WatchTrailerButton extends StatelessWidget {
  const WatchTrailerButton({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            side: BorderSide(color: AppColors.blueButton, width: 2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fixedSize:
                Size(AppSize.width(context), AppSize.height(context) * 0.07),
            backgroundColor: Colors.transparent),
        onPressed: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.play_arrow,
            ),
            Text(
              AppLabels.watchTrailer,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ));
  }
}
