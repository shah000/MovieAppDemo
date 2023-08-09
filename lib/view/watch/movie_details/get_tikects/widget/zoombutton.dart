import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';

class ZoomInButton extends StatelessWidget {
  const ZoomInButton({
    super.key,
    required this.iconData,
  });
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.lightGrey,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.white,
          child: Icon(
            iconData,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}

class ZoomOutButton extends StatelessWidget {
  const ZoomOutButton({
    super.key,
    required this.iconData,
  });
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.lightGrey,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Icon(
              iconData,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
