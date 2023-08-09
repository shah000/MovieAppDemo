import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_size.dart';

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key,
    required this.img,
    required this.title,
    required this.color,
  });
  final String img;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          img,
        ),
        SizedBox(
          height: AppSize.height(context) * 0.01,
        ),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
