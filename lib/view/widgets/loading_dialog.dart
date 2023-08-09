import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_size.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key, this.vlaue}) : super(key: key);
  final double? vlaue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.width(context),
      height: AppSize.height(context),
      child: Center(
        child: AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: vlaue,
                backgroundColor: AppColors.bottombarbg,
                color: AppColors.bgColor,
              ),
              const SizedBox(width: 20.0),
              const Text(
                'Please wait...',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
