import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/navigator.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar(
      {super.key, required this.movieName, required this.movieReleaseDate});
  final String movieName;
  final String movieReleaseDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        actions: [
          IconButton(
              onPressed: () {
                navigateBack();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
              )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    movieName,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  movieReleaseDate,
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
